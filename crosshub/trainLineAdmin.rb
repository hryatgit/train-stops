module BlueLine
  # stop names below geting modified, through suffix '-Blue' i.e. a => a-Blue
  STOPS = %w(a b c d e f g h).map {|stop| [stop, '-Blue'].join()}
  # stop names below are taken 'as they are', i.e. hub-5 => hub-5
  %w(hub-5 hub-7 hub-11 hub-12).map {|hub| STOPS << hub }
end
module GreenLine
  STOPS = %w(k l m n o p q).map {|stop| [stop, '-Green'].join()}
  %w(hub-5 hub-7 hub-8 hub-12, hub-13).map {|hub| STOPS << hub }
end
module RedLine
  STOPS = %w(a b c d e f).map {|stop| [stop, '-Red'].join()}
  %w(hub-7 hub-8 hub-11).map {|hub| STOPS << hub }
end
module OrangeLine
  STOPS = %w(a b c d e f).map {|stop| [stop, '-Orange'].join()}
  %w(hub-7 hub-8 hub-12).map {|hub| STOPS << hub }
end
module YellowLine
  STOPS = %w(a b c d e f).map {|stop| [stop, '-Yellow'].join()}
  %w(hub-7 hub-11 hub-13).map {|hub| STOPS << hub }
end

module ValidTrainLines
  # to get evaluated, train line must be listed below
  VALID_TRAIN_LINES = %w(BlueLine GreenLine RedLine OrangeLine YellowLine)
end
