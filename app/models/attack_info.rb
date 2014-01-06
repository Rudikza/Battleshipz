class AttackInfo < Struct.new(:board, :x, :y, :hit_status, :status)
  def coords_and_statuses
    { x: x, y: y, hit_status: hit_status, status: status }
  end
end