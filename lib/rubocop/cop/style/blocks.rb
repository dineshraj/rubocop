# encoding: utf-8

module Rubocop
  module Cop
    module Style
      class Blocks < Cop
        MULTI_LINE_MSG = 'Avoid using {...} for multi-line blocks.'
        SINGLE_LINE_MSG = 'Prefer {...} over do...end for single-line blocks.'

        def on_block(node)
          block_length = Util.block_length(node)
          block_begin = node.loc.begin.source

          if block_length > 0 && block_begin == '{'
            add_offence(:convention, node.loc.begin, MULTI_LINE_MSG)
          elsif block_length == 0 && block_begin != '{'
            add_offence(:convention, node.loc.begin, SINGLE_LINE_MSG)
          end

          super
        end
      end
    end
  end
end
