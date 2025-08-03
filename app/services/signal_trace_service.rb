class SignalTraceService

  MAX_LOOP = 50 # Total numbers of signal

  def initialize(start_calc_id)
    @start_calc_id = start_calc_id
    @trace_signals = []
    @loop_limit_exceeded = false
  end

  def call
    queue = [@start_calc_id]
    loop_count = 0

    while queue.any?
      # Next queue
      current_calc_id = queue.shift

      # Get current calculation
      current_calc = Calculation.find_by(id: current_calc_id)
      next unless current_calc

      # Get outputs(=3)
      outputs = current_calc.signalinfos.where(signal_type_id: '3')
      @trace_signals += outputs

      # Get next inputs(=2)
      output_names = outputs.pluck(:signal_name)
      next_input_signals = Signalinfo.where(signal_type_id: '2', signal_name: output_names)
      queue += next_input_signals.pluck(:calculation_id)

      # Depth limit
      loop_count += 1
      if loop_count >= MAX_LOOP
        @loop_limit_exceeded = true
        Rails.logger.warn("Signal trace exceeded trace limit from calculation #{Calculation.find_by(id: @start_calc_id).calculation_name}")
        break
      end
    end

    {
      results: @trace_signals.map do |s|
        {
          source_calculation: s.calculation.calculation_name,
          signal_name: s.signal_name
        }
      end,
      loop_limit_exceeded: @loop_limit_exceeded
    }
  end
end