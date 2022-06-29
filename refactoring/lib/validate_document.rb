class ValidateDocument
  FIRST_DIGIT = 9
  SECOND_DIGIT = 10
  FACTOR_FIRST_DIGIT = 10
  FACTOR_SECOND_DIGIT = 11
  MAX_DOCUMENT_LENGTH = 14
  MIN_DOCUMENT_LENGTH = 11
  VALIDATION_FACTOR = 11

  attr_reader :document

  def initialize(raw_document)
    @document = clean_document(raw_document)
  end

  def self.document_valid?(raw_document)
    self.new(raw_document).valid?
  end

  def valid?
    return false unless @document
    return false if @document.strip.empty?
    return false unless document_with_correct_length?
    return false if all_digits_same?

    first_check_digit_factor = fetch_check_digit_factor(FACTOR_FIRST_DIGIT)
    second_check_digit_factor = fetch_check_digit_factor(FACTOR_SECOND_DIGIT)

    return false unless first_check_digit_factor === fetch_check_digit(FIRST_DIGIT)
    return false unless second_check_digit_factor === fetch_check_digit(SECOND_DIGIT)
    
    true
  end

  private
  
  def document_with_correct_length?
    @document.length < MIN_DOCUMENT_LENGTH || @document.length > MAX_DOCUMENT_LENGTH ? false : true
  end

  def all_digits_same?
    first_document_digit = @document[0]

    @document.split('').all? do |current_digit|
      current_digit === first_document_digit
    end
  end
  
  def fetch_check_digit_factor(factor)
    validating_descending_sequence = (2..factor).reverse_each.map

    check_digit = check_digit_multipli_factor(validating_descending_sequence)

    rest_check_digit = check_digit % VALIDATION_FACTOR

    rest_check_digit < 2 ? 0 : VALIDATION_FACTOR - rest_check_digit
  end

  def check_digit_multipli_factor(validating_descending_sequence)
    validating_descending_sequence.each_with_index.reduce(0) do |accumulator, validator_pair|
      multiplication_factor, index_document_digit = validator_pair

      accumulator + @document[index_document_digit].to_i * multiplication_factor
    end
  end

  def fetch_check_digit(position_check_digit)
    @document[position_check_digit].to_i
  end

  def clean_document(raw_document)
    return unless raw_document

    raw_document.gsub(/\D/,'')
  end
end