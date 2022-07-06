RSpec.describe Document do
  subject { Document }
  context 'document with blank value' do
    it 'should return a document invalid' do
      document = ''

      expect(subject.document_valid?(document)).to be_falsy
    end

    it 'should return a document invalid' do
      document = '    '

      expect(subject.document_valid?(document)).to be_falsy
    end

    it 'should return a document invalid' do
      document = nil

      expect(subject.document_valid?(document)).to be_falsy
    end
  end

  context 'document without dots or specials caracters' do
    it 'should return a document invalid' do
      document = '11111111111'

      expect(subject.document_valid?(document)).to be_falsy
    end

    it 'should return a document valid' do
      document = '16845668000'

      expect(subject.document_valid?(document)).to be_truthy
    end

    it 'should return a document invalid' do
      document = '16845668001'

      expect(subject.document_valid?(document)).to be_falsy
    end
  end


  context 'document with dots or specials caracters' do
    it 'should return a document invalid' do
      document = '111.111.111-11'

      expect(subject.document_valid?(document)).to be_falsy
    end

    it 'should return a document invalid' do
      document = '168.456.680-10'

      expect(subject.document_valid?(document)).to be_falsy
    end

    it 'should return a document valid' do
      document = '757.747.220-40'

      expect(subject.document_valid?(document)).to be_truthy
    end

    it 'should return a document valid' do
      document = '713.271.920-39'

      expect(subject.document_valid?(document)).to be_truthy
    end

    it 'should return a document valid' do
      document = '712.591.330-01'

      expect(subject.document_valid?(document)).to be_truthy
    end

    it 'should return a document valid' do
      document = '    928.268.010-07'

      expect(subject.document_valid?(document)).to be_truthy
    end
  end
end