
require_relative '../lib/rules'
describe Linter do
  include Linter
  let(:arr1) { ['let array = 40;', 'const myAge = 52;', 'let name = gzim;'] }
  let(:arr2) { ['let array2 = 40', 'const Mkyage = 52', 'let Name = []'] }
  let(:arr3) { ['class arRay', 'class Mia'] }
  let(:arr4) { ['const Eso', 'let Remba', 'let = esvo'] }
  let(:linter) { Runfile.new('tests/test1.js') }

  describe '#check_semicolons' do
    it 'Checks whether the semicolon is present at the end' do
      @tot_errors = 0
      @semicolons_error = []
      expect(check_semicolons(arr2)).to eql([3, [1, 2, 3]])
    end
    it 'Array1 should not return any semicolon error' do
      expect(check_semicolons(arr1)).to eql([nil, nil])
    end
  end

  describe '#check_class' do
    it 'Checks whether the class or constant starts with Uppercase' do
      @cam_err = []
      @tot_errors = 0
      expect(check_class(arr3)).to eql([1, [1]])
    end
  end
  describe '#check_let_const' do
    it 'Cheks whether the variables and constants start with lowercase' do
      @var_error = []
      @tot_errors = 0
      expect(check_let_const(arr4)).to eql([2, [1, 2]])
    end
  end
end
