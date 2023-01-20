describe Board do
  subject(:board) { described_class.new }

  describe '#win_horiziontal?' do
  
    context 'there are four symbols in a row' do
 
      it 'returns true' do
      end

    end
    
  end

  describe '#win_diagonal?' do
    context 'there are four symbols in a diagonal consecutively' do

      it 'returns true' do

      end
    end
  end

  describe 'win_column?' do
    context 'there are four symbols in a column consecutively' do
      won_column = Array.new(6) { Array.new(7) { 'O' } }
      won_column[0..3].each do |row|
        row[0] = 'X'
      end

      before do
        board.instance_variable_set(:@grid, won_column)
      end

      it 'returns true' do 
        expect board.win_column?.to be true
      end
      
    end
  end
end