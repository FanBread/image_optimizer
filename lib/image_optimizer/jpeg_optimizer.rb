class ImageOptimizer
  class JPEGOptimizer < ImageOptimizerBase

  private

    def command_options
      flags = ['-f', '--all-progressive']
      flags << max_quantity if (0..100).include?(options[:quality])
      flags << strip_metadata if strip_metadata?
      flags << quiet if options[:quiet]
      flags << path
    end

    def max_quantity
      "--max=#{options[:quality]}"
    end

    def strip_metadata
      '--strip-all'
    end

    def strip_metadata?
      return options[:strip_metadata] if options.key? :strip_metadata
      true
    end

    def quiet
      '--quiet'
    end

    def extensions
      %w[jpeg jpg]
    end

    def type
      'jpeg'
    end

    def bin_name
      'jpegoptim'
    end

  end
end
