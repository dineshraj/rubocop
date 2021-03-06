# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe LineContinuation do
        let(:lc) { LineContinuation.new }

        it 'registers an offence for line continuation char' do
          inspect_source(lc,
                         ['test = 5 \\', '+ 5'])
          expect(lc.offences.size).to eq(1)
        end

        it 'does not register an offence for cont char in a string' do
          inspect_source(lc,
                         ['result = "test string\\\n"',
                          'more'])
          expect(lc.offences).to be_empty
        end
      end
    end
  end
end
