require 'separate_steps'

describe SeparateSteps do
  it 'R2, L3 is 5 blocks away' do
    input = 'R2, L3'
    result = described_class.call!(steps: input)
    expect(result).to eq [[:east, 2], [:north, 3]]
  end

  it 'R2, R2, R2 is 2 blocks away' do
    input = 'R2, R2, R2'
    result = described_class.call!(steps: input)
    expect(result).to eq [[:east, 2], [:south, 2], [:west, 2]]
  end

  it 'R5, L5, R5, R3 is 12 blocks away' do
    input = 'R5, L5, R5, R3'
    result = described_class.call!(steps: input)
    expect(result).to eq [[:east, 5], [:north, 5], [:east, 5], [:south, 3]]
  end
end
