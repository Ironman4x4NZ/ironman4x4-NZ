module Refinery
  module Ironman
    module Admin
      class OrdersController < ::Refinery::AdminController

        include Refinery::Ironman::Admin::OrdersHelper

        crudify :'refinery/ironman/order',
                :title_attribute => 'order_no',
                :xhr_paging => true,
                :sortable => false,
                :order => 'refinery_ironman_orders.created_at desc'

        def export
          # check max day
          from  = Date.strptime(params[:from], '%m/%d/%Y')
          to  = Date.strptime(params[:to], '%m/%d/%Y')
          
          if (to - from).to_i+1 <= 5
            # export between date
            orders = Refinery::Ironman::Order.where(:created_at => from.beginning_of_day..to.end_of_day).order(created_at: :desc)

            if orders.blank?
              flash[:error] = "Data not found."
              redirect_to :back
            else
              dates = params[:from] + " - " + params[:to]
              result = do_export(orders, dates)
              if result[:status]
                send_data result[:book], :filename => result[:name], :type =>  "application/vnd.ms-excel"
              else
                flash[:error] = result[:error]
                redirect_to :back
              end
            end
          else
            flash[:error] = "You are not allowed to export orders more than 5 days."
            redirect_to :back
          end
        end

      protected
        def order_params
          params.require(:order).permit(:order_no, :stockist_id, :name,
            :address1, :address2, :suburb, :postcode, :state, :country, :email,
            :phone, :enquiry_type, :vehicle_id, :comments, :receive_news, :spam,
            :locale, lines_attributes: [
              :product_id, :quantity, :net_amount, :tax_amount, :position,
              :id, :_destroy, :line_type, :order
            ])
        end
      end
    end
  end
end
