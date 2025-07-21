class SignalTraceService
  def initialize(start_calc_id)
    @start_calc_id = start_calc_id
    @trace_signals = []
  end

  def call
    queue = [@start_calc_id]

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
    end

    @trace_signals.map do |s|
      {
        signal_name: s.signal_name,
        source_calculation: s.calculation.calculation_name
      }
    end

  end
end