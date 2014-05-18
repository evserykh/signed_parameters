[![Build Status](https://travis-ci.org/evserykh/signed_parameters.svg?branch=master)](https://travis-ci.org/evserykh/signed_parameters) [![Dependency Status](https://gemnasium.com/evserykh/signed_parameters.svg)](https://gemnasium.com/evserykh/signed_parameters) [![Gem Version](https://badge.fury.io/rb/signed_parameters.svg)](http://badge.fury.io/rb/signed_parameters)
***
# SignedParameters

Allow to sign data with secret key

## Installation

Add this line to your application's Gemfile:

    gem 'signed_parameters'

And then execute:

    $ bundle
    
##How it works

Assume, the both sides know secret key, and one of them must send a data to another, and another side must receive the data and verify the data is signed with correct key. 

The sending side gets the sign and adds it to sending data, the receiving side does the same things with received data and compares obtained sign with received sign.    

## Algorithm of computing of sign

1. Build an array of values to be sended
2. Remove from the array empty values
3. Sort the array
4. Add secret key to the end of array
5. Join elements of array into a string
6. Compute the SHA-1 digest from the string from step 5
7. Compute the MD5 digest from the string from step 6

## Example

The sending data are { :email => 'test@test.com', :username => 'John Smith', :age => 66, :address => '' }

The secret key is c5fc6b5cff2d52791ecaae659200de5e

Step 1. [ 'test@test.com', 'John Smith', 66, '' ]

Step 2. [ 'test@test.com', 'John Smith', 66 ]

Step 3. [ 66, 'John Smith', 'test@test.com' ]

Step 4. [ 66, 'John Smith', 'test@test.com', 'c5fc6b5cff2d52791ecaae659200de5e' ]

Step 5. str = 66;John Smith;test@test.com;c5fc6b5cff2d52791ecaae659200de5e

Step 6. sha1 = SHA1(str)

Step 7. md5 = MD5(sha1)

So, for the data { :email => 'test@test.com', :username => 'John Smith', :age => 66, :address => '' } the sign will be 0fc248b16df686b7fcb5c5dc9ce701d

## Usage

```ruby
> params = { :email => 'test@test.com', :username => 'John Smith', :age => 66, :address => ''  }
 => {:email=>"test@test.com", :username=>"John Smith", :age=>66, :address=>""} 
> secret = 'c5fc6b5cff2d52791ecaae659200de5e'
 => "c5fc6b5cff2d52791ecaae659200de5e" 
> SignedParameters.to_query(params, secret)
 => "age=66&email=test%40test.com&sign=0fc248b16df686b7fcb5c5dc9ce701d8&username=John+Smith"
```
or
```ruby
> builder = SignedParameters::Builder.new(params, secret)
 => #<SignedParameters::Builder:0x007f8f8835c770 @parameters={:email=>"test@test.com", :username=>"John Smith", :age=>66, :address=>""}, @secret="c5fc6b5cff2d52791ecaae659200de5e", @separator=";"> 
> builder.sign
 => "0fc248b16df686b7fcb5c5dc9ce701d8"
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/signed_parameters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
