class FuzzyRulesController < ApplicationController
  before_action :set_fuzzy_rule, only: [:show, :edit, :update, :destroy]
 	before_filter { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

  # GET /fuzzy_rules
  def index
    @fuzzy_rules = FuzzyRule.all
  end

  # GET /fuzzy_rules/1
  def show
  end

  # GET /fuzzy_rules/new
  def new
    @fuzzy_rule = FuzzyRule.new
  end

  # GET /fuzzy_rules/1/edit
  def edit
  end

  # POST /fuzzy_rules
  def create
    @fuzzy_rule = FuzzyRule.new(fuzzy_rule_params)

    if @fuzzy_rule.save
      redirect_to @fuzzy_rule, notice: 'Fuzzy rule was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /fuzzy_rules/1
  def update
    if @fuzzy_rule.update(fuzzy_rule_params)
      redirect_to @fuzzy_rule, notice: 'Fuzzy rule was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /fuzzy_rules/1
  def destroy
    @fuzzy_rule.destroy
    redirect_to fuzzy_rules_url, notice: 'Fuzzy rule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuzzy_rule
      @fuzzy_rule = FuzzyRule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fuzzy_rule_params
      params.require(:fuzzy_rule).permit(:g1, :g2, :g3, :g4, :gres)
    end
end
