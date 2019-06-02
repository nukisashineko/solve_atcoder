require 'rspec'
require_relative './agc034_a'

describe Agc034A do
  context 'non_duplicated_zone_check' do
    it 'All or Nothing' do
      expect(Agc034A.non_duplicated_zone_check(0,9,'..........')).to be_truthy
      expect(Agc034A.non_duplicated_zone_check(0,9,'.#########')).to be_falsey
    end
    it 'can not move' do
      expect(Agc034A.non_duplicated_zone_check(0,9,'.##.......')).to be_falsey
    end
    it 'selected only one way' do
      expect(Agc034A.non_duplicated_zone_check(0,10,'.#.#.#.#.#.')).to be_truthy
    end
  end

  context'duplicated_zone_check' do
    context 'not need reverse' do
      it 'All or Nothing' do
        expect(Agc034A.duplicated_zone_check(1,10,'#..........#', false)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,10,'#.########.#', false)).to be_falsey
      end
      it 'can not move' do
        expect(Agc034A.duplicated_zone_check(1,10,'#.##.......#', false)).to be_falsey
      end
      it 'selected only one way' do
        expect(Agc034A.duplicated_zone_check(1,11,'#.#.#.#.#.#.#', false)).to be_truthy
      end
      it 'can reverse order' do
        expect(Agc034A.duplicated_zone_check(1,11,'#...#.#.#.#.#', false)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,11,'#.#.#.#.#...#', false)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,11,'#.#.#.#...#.#', false)).to be_truthy
      end
      it 'can not reverse order' do
        expect(Agc034A.duplicated_zone_check(1,10,'#..#.#.#.#.#', false)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,10,'#.#.#.#.#..#', false)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,10,'#.#.#.#..#.#', false)).to be_truthy
      end
    end

    context 'need reverse' do
      it 'All or Nothing' do
        expect(Agc034A.duplicated_zone_check(1,10,'#..........#', true)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,10,'#.##########', true)).to be_falsey
      end
      it 'can not move' do
        expect(Agc034A.duplicated_zone_check(1,10,'#.##.......#', true)).to be_falsey
      end
      it 'selected only one way' do
        expect(Agc034A.duplicated_zone_check(1,11,'#.#.#.#.#.#.#', true)).to be_falsey
      end
      it 'can reverse order' do
        expect(Agc034A.duplicated_zone_check(1,11,'#...#.#.#.#.#', true)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,11,'..#.#.#.#...#', true)).to be_truthy
        expect(Agc034A.duplicated_zone_check(1,11,'#.#.#.#...#.#', true)).to be_truthy
      end
      it 'can not reverse order' do
        expect(Agc034A.duplicated_zone_check(1,11,'#.#..#.#.#.#.#', true)).to be_falsey
        expect(Agc034A.duplicated_zone_check(1,11,'..#.#.#.#.#..#', true)).to be_falsey
        expect(Agc034A.duplicated_zone_check(1,11,'#.#.#.#.#..#.#', true)).to be_falsey
      end
    end

    context 'can reverse before start_i' do
      it 'return true' do
        expect(Agc034A.duplicated_zone_check(1,11,'...#.#.#..#.#', true)).to be_truthy
      end
    end
    context 'can reverse after end_i' do
      it 'return true' do
        expect(Agc034A.duplicated_zone_check(1,11,'#..#..#..#...', true)).to be_truthy
      end
    end
  end

  describe 'sample test' do
    it 'sample 1' do
      expect(Agc034A.calc(1,3,7,6, '.#..#..')).to be_falsey
    end
    it 'sample 2' do
      expect(Agc034A.calc(1,3,15,13, '...#.#...#.#...')).to be_truthy
    end
  end
end