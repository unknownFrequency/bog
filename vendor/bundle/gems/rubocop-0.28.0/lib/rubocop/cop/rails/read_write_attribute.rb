# encoding: utf-8

module RuboCop
  module Cop
    module Rails
      # This cop checks for the use of the read_attribute or
      # write_attribute methods.
      #
      # @example
      #
      #   # bad
      #   x = read_attributed(:attr)
      #   write_attribute(:attr, val)
      #
      #   # good
      #   x = self[:attr]
      #   self[:attr] = val
      class ReadWriteAttribute < Cop
        MSG = 'Prefer `%s` over `%s`.'

        def on_send(node)
          receiver, method_name, *_args = *node
          return if receiver
          return unless [:read_attribute,
                         :write_attribute].include?(method_name)

          add_offense(node, :selector)
        end

        def message(node)
          _receiver, method_name, *_args = *node

          if method_name == :read_attribute
            format(MSG, 'self[:attr]', 'read_attribute(:attr)')
          else
            format(MSG, 'self[:attr] = val', 'write_attribute(:attr, var)')
          end
        end
      end
    end
  end
end
