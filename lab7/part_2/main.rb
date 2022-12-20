# Объект — точка на плоскости, заданная радиальными координата-
# ми, умеющая выводить их на экран и возвращать в ответ на запрос в
# декартовых координатах.
# Объект — окружность, заданная центром и радиусом окружности,
# умеющая выводить их на экран и возвращать в ответ на запрос данные
# о координатах центра и радиусе.

class Point
  def initialize(x, y)
    @x = x
    @y = y
    @r = Math.sqrt(x * x + y * y).floor(1)
    @cos = x / @r
    @sin = y / @r
  end

  def show_dec
    print "Decart: x => #{@x}, y => #{@y};"
  end

  def show_pol
    print "Polar: x => #{@r}*cos(a), y => #{@y}*sin(a);"
  end
end

class Circle < Point
  def initialize(x, y, r)
    super(x, y)
    @radius = r
  end

  def show
    print 'Circle center: '
    show_dec
    print ' '
    show_pol
    print "\nCircle radius: #{@radius}\n"
  end
end
