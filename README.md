# Bizsh

An interactive ruby shell optimized business calculations.

## Usage

Install the shell via rubygems:

    $ gem install bizsh

Now fire up the shell!

    $ bizsh

You're greated with an interactive Ruby shell that's optimized for business calculations.

    bizsh> growth = '$ 100,000'.to_num.growth(150_000)
    => 0.5
    bizsh> growth.to_s(:percent)
    => "50.00%"
    bizsh> shares = 100
    => 100
    bizsh> value = shares * "MSFT".quote.ask
    => 4759.0

## Why?

The calculator apps that ship on Mac and Windows are great for really basic calculations, but are lacking when a few variables need to be set to complete a calculation. Spreadsheets are great for building models or very complex calculations, but too heavy for running simpler calculations. There are desktop and online apps that do calculations, but are clunky or have ads all over the place.

I wrote `bizsh` after I found myself running a lot of common calculations in `irb`.

## Contributing

Contributions for new functions, documentation, and tests are welcome!

1. Fork it ( https://github.com/bradgessler/bizsh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
