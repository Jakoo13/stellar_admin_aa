
module Contractors
    class ContractorsController < ApplicationController

        before_action :authenticate_contractor!
        before_action :find_contractor, only: %i[show]

        def index
            contractors = Contractor.all
            render json: contractors
        end

        def show
            render json: @contractor
        end

        private

        def find_contractor
            @contractor = Contractor.find(params[:id])
        end

    end
end