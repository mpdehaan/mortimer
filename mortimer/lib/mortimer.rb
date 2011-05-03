#!/usr/bin/ruby
 
require "getoptlong"
require "rubygems"
require "maruku"

opt = GetoptLong.new(
  [ "--indir", "-i", GetoptLong::REQUIRED_ARGUMENT  ],
  [ "--outdir", "-o", GetoptLong::REQUIRED_ARGUMENT ]
)

# I must not be using the cool kids' Getopt
input_dir = nil
output_dir = nil
opt.each_option do |name, value|
   case name
       when "--indir"
          input_dir = value
       when "--outdir"
          output_dir = value
   end
end

# die if "required" arguments aren't supplied 
# hey, shouldn't REQUIRED already do this?  GRR!
raise "--indir is required"  if input_dir.nil?
raise "--outdir is required" if output_dir.nil?
Dir.mkdir(output_dir) unless File.exists?(output_dir)

# load up common headers and footers, stylesheets
# TODO: recursively copy any graphics
header = IO.read("#{input_dir}/header.snippet")
footer = IO.read("#{input_dir}/footer.snippet")
FileUtils.cp("#{input_dir}/markdown.css","#{output_dir}/markdown.css")

# walk through the output directory and make corresponding
# files in the output directory
Dir.glob("#{input_dir}/*.md").each do |markdown_file|
   basename = File.basename(markdown_file, '.md')
   outfile  = "#{output_dir}/#{basename}.html"
   puts "processing #{markdown_file} -> #{outfile}" 
   doc = Maruku.new(IO.read(markdown_file))
   File.open(outfile,'w') do |out|
       out.write(header)
       out.write(doc.to_html)
       out.write(footer)
   end
end


