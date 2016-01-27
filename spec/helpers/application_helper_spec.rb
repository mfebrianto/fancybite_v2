require 'rails_helper'

describe ApplicationHelper do

  describe 'customer_buy_active?' do

    let(:feature) { FeatureControl.new(disabled: true) }

    before do
      allow(FeatureControl).to receive(:find).with(1) { feature }
    end

    subject { helper.customer_buy_active? }


    context 'shop feature disabled' do
      it { is_expected.to be false }
    end
  end

end
