class Point < Struct.new(:name, :x, :y)
  def printData
    puts [self.name, " x:", self.x,  ", y:", self.y ].join('')
  end
  def getX
    x
  end
  def getY
    y
  end
end

class Rectangle
  def initialize(name, p1, p2)
    @name = name
    @bl   = Point.new('@bl', [p1.x, p2.x].min, [p1.y, p2.y].min) # botomLeft
    @tr   = Point.new('@tr', [p1.x, p2.x].max, [p1.y, p2.y].max) #topRight
  end
  def printData
    puts [@name, ':'].join()
    @bl.printData()
    @tr.printData()
    puts "========================"
  end
  def getName
    @name
  end
  def get_blx
    @bl.getX
  end
  def get_bly
    @bl.getY
  end
  def get_trx
    @tr.getX
  end
  def get_try
    @tr.getY
  end
end

class RectJoin
  def initialize(r1, r2)
    @name = [r1.getName, r2.getName].join(' X ')
    @bl = Point.new('@bl', [r1.get_blx, r2.get_blx].max, [r1.get_bly, r2.get_bly].max)
    @tr = Point.new('@tr', [r1.get_trx, r2.get_trx].min, [r1.get_try, r2.get_try].min)
    @width = @tr.getX() - @bl.getX()
    @hight = @tr.getY() - @bl.getY()
    @status = (@width <= 0 or @hight <=0) ? "INVALID" : "VALID"
  end
  def printData
    puts [["rectJoin:", @name].join(' '), ':'].join()
    puts ['width:', @width, 'hight:', @hight, 'status:', @status].join(' ')
  end
end


# MAIN
p1 = Point.new('p1', -7, 8)
p2 = Point.new('p2', 5, -5)
r1 = Rectangle.new('rect1',p2, p1)

p3 = Point.new('p3', 3, 2)
p4 = Point.new('p4', 5, -7)
r2 = Rectangle.new('rect2', p3, p4)

r1.printData()
r2.printData()
join = RectJoin.new(r1, r2)
join.printData()


