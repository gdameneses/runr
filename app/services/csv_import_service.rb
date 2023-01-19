class CsvImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    csv = []
    CSV.foreach(opened_file, headers: :first_row, header_converters: :symbol, col_sep: "\t", encoding: 'utf-16le:utf-8') do |row|
      first_name = row[:employee_name].split(', ')[1]
      last_name = row[:employee_name].split(', ')[0]
      name = "#{first_name} #{last_name}"
      row[:employee_name] = name
      csv << row.to_hash
    end
  end
end
