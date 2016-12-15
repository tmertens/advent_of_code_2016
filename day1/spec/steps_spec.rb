require 'distance_calculator'

describe DistanceCalculator do
  it 'R2, L3 is 5 blocks away' do
    input = 'R2, L3'
    result = DistanceCalculator.call!(steps: input)
    expect(result).to eq 5
  end

  it 'R2, R2, R2 is 2 blocks away' do
    input = 'R2, R2, R2'
    result = DistanceCalculator.call!(steps: input)
    expect(result).to eq 2
  end

  it 'R5, L5, R5, R3 is 12 blocks away' do
    input = 'R5, L5, R5, R3'
    result = DistanceCalculator.call!(steps: input)
    expect(result).to eq 12
  end

  it 'solves the given scenario' do
    input = 'R5, R4, R2, L3, R1, R1, L4, L5, R3, L1, L1, R4, L2, R1, R4, R4, L2, L2, R4, L4, R1, R3, L3, L1, L2, R1, R5, L5, L1, L1, R3, R5, L1, R4, L5, R5, R1, L185, R4, L1, R51, R3, L2, R78, R1, L4, R188, R1, L5, R5, R2, R3, L5, R3, R4, L1, R2, R2, L4, L4, L5, R5, R4, L4, R2, L5, R2, L1, L4, R4, L4, R2, L3, L4, R2, L3, R3, R2, L2, L3, R4, R3, R1, L4, L2, L5, R4, R4, L1, R1, L5, L1, R3, R1, L2, R1, R1, R3, L4, L1, L3, R2, R4, R2, L2, R1, L5, R3, L3, R3, L1, R4, L3, L3, R4, L2, L1, L3, R2, R3, L2, L1, R4, L3, L5, L2, L4, R1, L4, L4, R3, R5, L4, L1, L1, R4, L2, R5, R1, R1, R2, R1, R5, L1, L3, L5, R2'
    result = described_class.call!(steps: input)
    expect(result).to eq 231
  end
end
