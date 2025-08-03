module ApplicationHelper
  def history_event_name(event)
    case event
      when "create" then "作成"
      when "update" then "更新"
      when "destroy" then "削除"
    end
  end

  def history_model_name(model)
    case model
      when "Car" then "車両"
      when "Calculation" then "演算"
      when "Signalinfo" then "信号"
    end
  end
end
