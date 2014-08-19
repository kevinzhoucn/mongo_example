class DesignPattern::FrontController < ApplicationController  
  include DesignPattern
  def index
    @data ||= []

    html_formatter = Strategy::HTMLFormatter.new
    report = Report.new(html_formatter)
    @data << report.output_report

    report.formatter = Strategy::PlainTextFormatter.new
    @data << report.output_report

    @data << Strategy::HTML_TEST

    report02 = Report02.new &Strategy::HTML_FORMATTER
    @data << report02.output_report

    # report02 = Report02.new &Strategy::PLAIN_TEXT_FORMATTER
    report02.formatter = Strategy::PLAIN_TEXT_FORMATTER
    @data << report02.output_report

    strategy = Report03.new
    # @data << Report03.html_formatter(strategy)
    @data << strategy.html_formatter
    @data << strategy.plain_text_formatter

    @data << ( strategy.output_report &Strategy::HTML_FORMATTER_02 )

    # @data << Strategy::HTML_FORMATTER_02.to_s

    # @data << strategy.output_report &Strategy::HTML_FORMATTER_02

    # @data << Report03.HTML_FORMATTER

    strategy01 = Report04.new
    @data << strategy.html_formatter
  end

  def iobserver
    @data ||= []
    payroll = Payroll.new
    fred = Employee.new('Fred', 'Crane Operator', 30000, payroll)
    fred.salary = 35000
    @data << payroll.result
    fred.salary = 40000
    @data << payroll.result

    fred = Employee01.new('Fred', 'Crane Operator', 30000)
    fred.add_observer(payroll)
    fred.salary = 36000
    @data << payroll.result

    tax_man = TaxMan.new
    fred.add_observer(tax_man)
    fred.salary = 42000
    @data << payroll.result
    @data << tax_man.result

    fred = Employee02.new('Fred', 'Crane Operator', 30000)
    payroll = Payroll.new
    fred.add_observer(payroll)
    fred.salary = 36000
    @data << payroll.result

    tax_man = TaxMan.new
    fred.add_observer(tax_man)
    fred.salary = 42000
    @data << payroll.result
    @data << tax_man.result

    fred = Employee03.new('Fred', 'Crane Operator', 30000)
    payroll = Payroll.new
    fred.add_observer(payroll)
    fred.salary = 32000
    @data << payroll.result

    # fred = Employee04.new('Fred', 'Crane Operator', 30000)
    # fred.add_observer do |changed_employee|

    # end
    # fred.salary = 32000
    # @data << payroll.result
  end

  def icomposite
    @data ||= []
    start = Istart.new

    icomposite = MakeBatterTask.new
    @data << icomposite.get_time_required.to_s
  end
end