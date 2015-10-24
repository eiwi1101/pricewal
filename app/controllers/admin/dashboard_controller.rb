module Admin
class DashboardController < AdminController

  def main
    @range = (Date.today - 6) .. Date.today
    @page_views = PageView.where(created_at: 1.week.ago..Time.now).group_by { |i| i.created_at.to_date }
    
    @total = {
      views:  Hash[ @page_views.collect { |d,l| [ d, l.count ] } ],
      sessions: Hash[ @page_views.collect { |d,l| [ d, l.group_by(&:session_id).count ] } ],
      pps: Hash[ @page_views.collect { |d,l| [ d, ( l.count / l.group_by(&:session_id).count ) ] } ]
    }
  end

end
end
