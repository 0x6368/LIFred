module Moneta
  class Transformer
    # @api private
    module Helper
      extend self

      def escape(value)
        value.gsub(/[^a-zA-Z0-9_-]+/){ '%' + $&.unpack('H2' * $&.bytesize).join('%').upcase }
      end

      def unescape(value)
        value.gsub(/((?:%[0-9a-fA-F]{2})+)/){ [$1.delete('%')].pack('H*') }
      end

      def hmacverify(value, secret)
        hash, value = value[0..31], value[32..-1]
        value if hash == OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, value)
      end

      def hmacsign(value, secret)
        OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, value) << value
      end

      def truncate(value, maxlen)
        if value.size >= maxlen
          digest = Digest::MD5.hexdigest(value)
          value = value[0, maxlen-digest.size] << digest
        end
        value
      end

      def spread(value)
        ::File.join(value[0..1], value[2..-1])
      end

      def bzip2(value)
        io = ::StringIO.new
        bz = ::RBzip2::Compressor.new(io)
        bz.write(value)
        bz.close
        io.string
      end

      def bunzip2(value)
        ::RBzip2::Decompressor.new(::StringIO.new(value)).read
      end

      autoload :BSON, 'moneta/transformer/helper/bson'
    end
  end
end
