---
title: Ruby Gem para FedEx.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Objetivo: Crear un Gem en ruby que permite conectarse
  al webservice de FedEx para"
draft: false
---

# Ruby Gem para FedEx.

## ✅ TODOs
- [ ] s `build_xml_request` y `parse_xml_response` para manejar la construcción de la solicitud XML y el análisis de la respuesta XML, respectivamente. Para esto, te sugiero utilizar la gema Nokogiri, que facilita el trabajo con documentos XML en Ruby.
- [ ] s faltantes:
- [ ] , di es todo
- [ ] para la implementación básica del gem. Con este código, podrás conectarte al webservice de FedEx para obtener las tarifas de envío utilizando la colección de Postman proporcionada.
- [ ] `get` devuelve un array de tarifas de envío. Dependiendo de tus necesidades, puedes añadir más pruebas para cubrir casos adicionales o para probar las funciones auxiliares, como `build_xml_request` y `parse_xml_response`. Sin embargo, dado que estas funciones son privadas y no están expuestas directamente al usuario, es posible que prefieras centrarte en probar la funcionalidad expuesta en lugar de las funciones internas.

## 🧠 Full Chat

🙋 **You:**

Objetivo: Crear un Gem en ruby que permite conectarse al webservice de FedEx para
obtener las tarifas de envíos.
Modo de uso de la Gem después de instalar en un proyecto de Rails:

```ruby
quote_params = {
  address_from: {
    zip: "64000",
    country: "MX"
  },
  address_to: {
    zip: "64000",
    country: "MX"
  },
  parcel: {
    length: 25.0,
    width: 28.0,
    height: 46.0,
    distance_unit: "cm",
    weight: 6.5,
    mass_unit: "kg"
  }
}

rates = Fedex::Rates.get(credentials, quote_params)
# example response
[{
"price": 218.05,
"currency": "mxn",
"service_level": {
"name": "Standard Overnight",
"token": "STANDARD_OVERNIGHT"
}
},
{
"price": 139.08,
"currency": "MXN",
"service_level": {
"name": "Fedex Express Saver",
"token": "FEDEX_EXPRESS_SAVER"
}
}
]
```

---

🤖 **Assistant:**

Para crear un gem en Ruby que permita conectarse al webservice de FedEx y obtener las tarifas de envíos, sigue estos pasos:

1. Crear la estructura básica del gem:

Crea una carpeta para el gem, por ejemplo `fedex_rates`, y dentro crea la estructura de archivos básica:

```
fedex_rates/
  lib/
    fedex_rates.rb
    fedex_rates/
      version.rb
  fedex_rates.gemspec
```

2. Crear el archivo `fedex_rates.gemspec`:

Este archivo define las propiedades y dependencias del gem. Asegúrate de agregar la dependencia del SDK de FedEx.

```ruby
# fedex_rates.gemspec
Gem::Specification.new do |s|
  s.name        = "fedex_rates"
  s.version     = Fedex::Rates::VERSION
  s.date        = "2023-04-16"
  s.summary     = "Ruby gem to get FedEx shipping rates"
  s.description = "A simple Ruby gem to connect to the FedEx webservice and get shipping rates"
  s.authors     = ["Your Name"]
  s.email       = "your.email@example.com"
  s.files       = Dir["lib/**/*"]
  s.homepage    = "https://github.com/username/fedex_rates"
  s.license     = "MIT"

  s.add_dependency "httparty", "~> 0.18.1"
  s.add_dependency "fedex", "~> 3.12.0"
  s.add_dependency "builder", "~> 3.2.4"
end
```

3. Crear el archivo `version.rb`:

Este archivo contiene la versión del gem.

```ruby
# lib/fedex_rates/version.rb
module Fedex
  module Rates
    VERSION = "0.1.0"
  end
end
```

4. Crear el archivo `fedex_rates.rb`:

Este archivo contiene la implementación principal del gem.

```ruby
# lib/fedex_rates.rb
require "fedex_rates/version"
require "httparty"
require "fedex"

module Fedex
  module Rates
    class Error < StandardError; end

    def self.get(credentials, quote_params)
      # Implementar la lógica para conectarse al webservice de FedEx y obtener las tarifas de envíos
    end
  end
end
```

5. Implementar la lógica para conectarse al webservice de FedEx y obtener las tarifas de envíos:

```ruby
# lib/fedex_rates.rb
# ...
module Fedex
  module Rates
    class Error < StandardError; end

    def self.get(credentials, quote_params)
      fedex = Fedex::Shipment.new(credentials)

      options = {
        shipper: quote_params[:address_from],
        recipient: quote_params[:address_to],
        packages: [quote_params[:parcel]],
        ship_timestamp: Time.now,
        service_type: 'ALL'
      }

      rate = fedex.rate(options)

      rate[:rate_reply_details].map do |details|
        {
          price: details[:rated_shipment_details][0][:shipment_rate_detail][:total_net_charge][:amount].to_f,
          currency: details[:rated_shipment_details][0][:shipment_rate_detail][:total_net_charge][:currency],
          service_level: {
            name: details[:service_type],
            token: details[:service_type]
          }
        }
      end
    end
  end
end
```

6. Construir e instalar el gem localmente:

En la carpeta

---

🙋 **You:**

continua

---

🤖 **Assistant:**

En la carpeta del proyecto, ejecuta los siguientes comandos para construir e instalar el gem localmente:

```
gem build fedex_rates.gemspec
gem install fedex_rates-0.1.0.gem
```

7. Utilizar el gem en un proyecto Rails:

Agrega la dependencia del gem en tu archivo `Gemfile`:

```ruby
gem 'fedex_rates', '~> 0.1.0'
```

Ejecuta `bundle install` para instalar la dependencia.

Ahora puedes usar el gem en tu proyecto Rails como se indica en el ejemplo proporcionado:

```ruby
quote_params = {
  address_from: {
    zip: "64000",
    country: "MX"
  },
  address_to: {
    zip: "64000",
    country: "MX"
  },
  parcel: {
    length: 25.0,
    width: 28.0,
    height: 46.0,
    distance_unit: "cm",
    weight: 6.5,
    mass_unit: "kg"
  }
}

rates = Fedex::Rates.get(credentials, quote_params)
```

Con esto, has creado un gem en Ruby que permite conectarse al webservice de FedEx y obtener las tarifas de envíos. Puedes ajustar la implementación según las necesidades de tu proyecto y seguir las mejores prácticas para publicar y mantener el gem.

---

🙋 **You:**

El tutorial es valido para la siguiente coleccion de postman?
{
	"info": {
		"_postman_id": "3edde93d-05b2-4c8f-a1f6-082121ff4d0a",
		"name": "Fedex",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "get rates",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "<RateRequest xmlns=\"http://fedex.com/ws/rate/v13\">\n  <WebAuthenticationDetail>\n    <UserCredential>\n      <Key>bkjIgUhxdghtLw9L</Key>\n      <Password>6p8oOccHmDwuJZCyJs44wQ0Iw</Password>\n    </UserCredential>\n  </WebAuthenticationDetail>\n  <ClientDetail>\n    <AccountNumber>510087720</AccountNumber>\n    <MeterNumber>119238439</MeterNumber>\n    <Localization>\n      <LanguageCode>es</LanguageCode>\n      <LocaleCode>mx</LocaleCode>\n    </Localization>\n  </ClientDetail>\n  <Version>\n    <ServiceId>crs</ServiceId>\n    <Major>13</Major>\n    <Intermediate>0</Intermediate>\n    <Minor>0</Minor>\n  </Version>\n  <ReturnTransitAndCommit>true</ReturnTransitAndCommit>\n  <RequestedShipment>\n    <DropoffType>REGULAR_PICKUP</DropoffType>\n    <PackagingType>YOUR_PACKAGING</PackagingType>\n    <Shipper>\n      <Address>\n        <StreetLines></StreetLines>\n        <City></City>\n        <StateOrProvinceCode>XX</StateOrProvinceCode>\n        <PostalCode>64000</PostalCode>\n        <CountryCode>MX</CountryCode>\n      </Address>\n    </Shipper>\n    <Recipient>\n      <Address>\n        <StreetLines></StreetLines>\n        <City></City>\n        <StateOrProvinceCode>XX</StateOrProvinceCode>\n        <PostalCode>06500</PostalCode>\n        <CountryCode>MX</CountryCode>\n        <Residential>false</Residential>\n      </Address>\n    </Recipient>\n    <ShippingChargesPayment>\n      <PaymentType>SENDER</PaymentType>\n    </ShippingChargesPayment>\n    <RateRequestTypes>ACCOUNT</RateRequestTypes>\n    <PackageCount>1</PackageCount>\n    <RequestedPackageLineItems>\n      <GroupPackageCount>1</GroupPackageCount>\n      <Weight>\n        <Units>KG</Units>\n        <Value>1</Value>\n      </Weight>\n      <Dimensions>\n      <Length>10</Length>\n      <Width>10</Width>\n      <Height>10</Height>\n      <Units>CM</Units>\n      </Dimensions>\n    </RequestedPackageLineItems>\n  </RequestedShipment>\n</RateRequest>",
					"options": {
						"raw": {
							"language": "xml"
						}
					}
				},
				"url": {
					"raw": "https://wsbeta.fedex.com:443/xml",
					"protocol": "https",
					"host": [
						"wsbeta",
						"fedex",
						"com"
					],
					"port": "443",
					"path": [
						"xml"
					]
				}
			},
			"response": []
		}
	]
}

---

🤖 **Assistant:**

Sí, es posible modificar el tutorial para que funcione con la colección de Postman proporcionada. Para lograr esto, debes cambiar la implementación de la función `get` en el archivo `fedex_rates.rb` para que utilice HTTParty en lugar de la gema FedEx y envíe una solicitud POST en formato XML como en la colección de Postman.

Aquí está la versión modificada de la función `get`:

```ruby
# lib/fedex_rates.rb
# ...
module Fedex
  module Rates
    class Error < StandardError; end

    def self.get(credentials, quote_params)
      xml_body = build_xml_request(credentials, quote_params)

      response = HTTParty.post(
        "https://wsbeta.fedex.com:443/xml",
        body: xml_body,
        headers: { 'Content-Type' => 'application/xml' }
      )

      parse_xml_response(response.body)
    end

    private

    def self.build_xml_request(credentials, quote_params)
      # Implementar la lógica para construir la solicitud XML utilizando
      # las credenciales y los parámetros de cotización proporcionados
    end

    def self.parse_xml_response(response)
      # Implementar la lógica para analizar la respuesta XML y devolver
      # las tarifas de envío en el formato esperado
    end
  end
end
```

Necesitarás implementar los métodos `build_xml_request` y `parse_xml_response` para manejar la construcción de la solicitud XML y el análisis de la respuesta XML, respectivamente. Para esto, te sugiero utilizar la gema Nokogiri, que facilita el trabajo con documentos XML en Ruby.

Agrega la dependencia de Nokogiri en tu archivo `fedex_rates.gemspec`:

```ruby
s.add_dependency "nokogiri", "~> 1.12.5"
```

Luego, actualiza la implementación en `fedex_rates.rb` para incluir los métodos faltantes:

```ruby
# lib/fedex_rates.rb
# ...
require "nokogiri"

module Fedex
  module Rates
    # ...

    private

    def self.build_xml_request(credentials, quote_params)
      # Utilizar Nokogiri para construir la solicitud XML
      # de acuerdo con la estructura de la colección de Postman
    end

    def self.parse_xml_response(response)
      # Utilizar Nokogiri para analizar la respuesta XML
      # y extraer las tarifas de envío en el formato esperado
    end
  end
end
```

No olvides instalar la gema Nokogiri y actualizar tus dependencias ejecutando `bundle install`. A continuación, implementa la lógica para construir y analizar las solicitudes y respuestas XML usando Nokogiri. Puedes encontrar documentación y ejemplos en el sitio web de [Nokogiri](https://nokogiri.org/tutorials/).

Una vez que hayas completado estos pasos, tu gem debería ser compatible con la colección de Postman proporcionada.

---

🙋 **You:**

Puedes reescribir el tutorial considerando tanto el ejemplo en markdown como la coleccion de postman?

---

🤖 **Assistant:**

Claro, aquí tienes el tutorial revisado para crear un gem en Ruby que permita conectarse al webservice de FedEx utilizando la colección de Postman proporcionada:

1. Crear la estructura básica del gem:

Crea una carpeta para el gem, por ejemplo `fedex_rates`, y dentro crea la estructura de archivos básica:

```
fedex_rates/
  lib/
    fedex_rates.rb
    fedex_rates/
      version.rb
  fedex_rates.gemspec
```

2. Crear el archivo `fedex_rates.gemspec`:

Este archivo define las propiedades y dependencias del gem.

```ruby
# fedex_rates.gemspec
Gem::Specification.new do |s|
  s.name        = "fedex_rates"
  s.version     = Fedex::Rates::VERSION
  s.date        = "2023-04-16"
  s.summary     = "Ruby gem to get FedEx shipping rates"
  s.description = "A simple Ruby gem to connect to the FedEx webservice and get shipping rates"
  s.authors     = ["Your Name"]
  s.email       = "your.email@example.com"
  s.files       = Dir["lib/**/*"]
  s.homepage    = "https://github.com/username/fedex_rates"
  s.license     = "MIT"

  s.add_dependency "httparty", "~> 0.18.1"
  s.add_dependency "nokogiri", "~> 1.12.5"
  s.add_dependency "builder", "~> 3.2.4"
end
```

3. Crear el archivo `version.rb`:

Este archivo contiene la versión del gem.

```ruby
# lib/fedex_rates/version.rb
module Fedex
  module Rates
    VERSION = "0.1.0"
  end
end
```

4. Crear el archivo `fedex_rates.rb`:

Este archivo contiene la implementación principal del gem.

```ruby
# lib/fedex_rates.rb
require "fedex_rates/version"
require "httparty"
require "nokogiri"

module Fedex
  module Rates
    class Error < StandardError; end

    def self.get(credentials, quote_params)
      xml_body = build_xml_request(credentials, quote_params)

      response = HTTParty.post(
        "https://wsbeta.fedex.com:443/xml",
        body: xml_body,
        headers: { 'Content-Type' => 'application/xml' }
      )

      parse_xml_response(response.body)
    end

    private

    def self.build_xml_request(credentials, quote_params)
      # Implementar la lógica para construir la solicitud XML utilizando
      # las credenciales y los parámetros de cotización proporcionados
    end

    def self.parse_xml_response(response)
      # Implementar la lógica para analizar la respuesta XML y devolver
      # las tarifas de envío en el formato esperado
    end
  end
end
```

5. Implementar la lógica para construir y analizar las solicitudes y respuestas XML usando Nokogiri:

```ruby
# lib/fedex_rates.rb
# ...
module Fedex
  module Rates
    # ...

    private

    def self.build_xml_request(credentials, quote_params)
      builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.RateRequest('xmlns' => 'http://fedex.com/ws/rate/v13') {
          xml.WebAuthenticationDetail {
            xml.UserCredential {
              xml.Key credentials[:key

---

🙋 **You:**

continua, vuelve a abrir el bloque de codigo donde interrupiste para no tener errores de format

---

🤖 **Assistant:**

Mis disculpas por la interrupción en el bloque de código. Aquí está la implementación completa de la lógica para construir y analizar las solicitudes y respuestas XML usando Nokogiri:

```ruby
# lib/fedex_rates.rb
# ...
module Fedex
  module Rates
    # ...

    private

    def self.build_xml_request(credentials, quote_params)
      builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.RateRequest('xmlns' => 'http://fedex.com/ws/rate/v13') {
          xml.WebAuthenticationDetail {
            xml.UserCredential {
              xml.Key credentials[:key]
              xml.Password credentials[:password]
            }
          }
          xml.ClientDetail {
            xml.AccountNumber credentials[:account_number]
            xml.MeterNumber credentials[:meter_number]
            xml.Localization {
              xml.LanguageCode "es"
              xml.LocaleCode "mx"
            }
          }
          xml.Version {
            xml.ServiceId "crs"
            xml.Major "13"
            xml.Intermediate "0"
            xml.Minor "0"
          }
          xml.ReturnTransitAndCommit true
          xml.RequestedShipment {
            xml.DropoffType "REGULAR_PICKUP"
            xml.PackagingType "YOUR_PACKAGING"
            xml.Shipper {
              xml.Address {
                xml.PostalCode quote_params[:address_from][:zip]
                xml.CountryCode quote_params[:address_from][:country]
              }
            }
            xml.Recipient {
              xml.Address {
                xml.PostalCode quote_params[:address_to][:zip]
                xml.CountryCode quote_params[:address_to][:country]
                xml.Residential false
              }
            }
            xml.ShippingChargesPayment {
              xml.PaymentType "SENDER"
            }
            xml.RateRequestTypes "ACCOUNT"
            xml.PackageCount 1
            xml.RequestedPackageLineItems {
              xml.GroupPackageCount 1
              xml.Weight {
                xml.Units quote_params[:parcel][:mass_unit].upcase
                xml.Value quote_params[:parcel][:weight]
              }
              xml.Dimensions {
                xml.Length quote_params[:parcel][:length]
                xml.Width quote_params[:parcel][:width]
                xml.Height quote_params[:parcel][:height]
                xml.Units quote_params[:parcel][:distance_unit].upcase
              }
            }
          }
        }
      end
      builder.to_xml
    end

    def self.parse_xml_response(response)
      doc = Nokogiri::XML(response)
      rates = []

      doc.xpath('//v13:RateReplyDetails', 'v13' => 'http://fedex.com/ws/rate/v13').each do |rate_reply|
        service_type = rate_reply.at_xpath('.//v13:ServiceType', 'v13' => 'http://fedex.com/ws/rate/v13').content
        amount = rate_reply.at_xpath('.//v13:NetCharge/v13:Amount', 'v13' => 'http://fedex.com/ws/rate/v13').content
        currency = rate_reply.at_xpath('.//v13:NetCharge/v13:Currency', 'v13' => 'http://fedex.com/ws/rate/v13').content

        rates << {
          'price': amount.to_f,
          'currency': currency,
          'service_level': {
            'name': service_type,
            'token': service_type
          }
        }
      end

      rates
    end
  end
end
```

Con esta implementación, el gem utilizará Nokogiri para construir la solicitud XML y analizar la respuesta XML.

---

🙋 **You:**

continua si hay mas. Si es todo, di es todo

---

🤖 **Assistant:**

Eso es todo para la implementación básica del gem. Con este código, podrás conectarte al webservice de FedEx para obtener las tarifas de envío utilizando la colección de Postman proporcionada.

Recuerda que para usar el gem en un proyecto de Rails, deberás agregarlo a tu `Gemfile` y ejecutar `bundle install`. Luego podrás utilizarlo de la siguiente manera:

```ruby
quote_params = {
  address_from: {
    zip: "64000",
    country: "MX"
  },
  address_to: {
    zip: "64000",
    country: "MX"
  },
  parcel: {
    length: 25.0,
    width: 28.0,
    height: 46.0,
    distance_unit: "cm",
    weight: 6.5,
    mass_unit: "kg"
  }
}

credentials = {
  key: "bkjIgUhxdghtLw9L",
  password: "6p8oOccHmDwuJZCyJs44wQ0Iw",
  account_number: "510087720",
  meter_number: "119238439"
}

rates = Fedex::Rates.get(credentials, quote_params)
```

Si necesitas agregar más funcionalidad o ajustar el gem para adaptarlo a tus necesidades específicas, puedes hacerlo modificando la implementación actual.

---

🙋 **You:**

Olvidaste añadir pruebas. Usa RSpec

---

🤖 **Assistant:**

Mis disculpas por no incluir las pruebas. Aquí tienes un ejemplo de cómo configurar y escribir pruebas usando RSpec para el gem `fedex_rates`:

1. Añade la dependencia de `rspec` a tu `fedex_rates.gemspec`:

```ruby
# fedex_rates.gemspec
# ...
s.add_development_dependency "rspec", "~> 3.10"
```

2. Instala la nueva dependencia ejecutando `bundle install`.

3. Ejecuta `bundle exec rspec --init` para generar la estructura básica de RSpec.

4. Crea un archivo de prueba para el módulo `Fedex::Rates` en la carpeta `spec`:

```
spec/
  fedex_rates_spec.rb
```

5. Añade las pruebas al archivo `fedex_rates_spec.rb`:

```ruby
# spec/fedex_rates_spec.rb
require "spec_helper"
require "fedex_rates"

RSpec.describe Fedex::Rates do
  let(:credentials) do
    {
      key: "bkjIgUhxdghtLw9L",
      password: "6p8oOccHmDwuJZCyJs44wQ0Iw",
      account_number: "510087720",
      meter_number: "119238439"
    }
  end

  let(:quote_params) do
    {
      address_from: {
        zip: "64000",
        country: "MX"
      },
      address_to: {
        zip: "64000",
        country: "MX"
      },
      parcel: {
        length: 25.0,
        width: 28.0,
        height: 46.0,
        distance_unit: "cm",
        weight: 6.5,
        mass_unit: "kg"
      }
    }
  end

  describe ".get" do
    it "returns an array of shipping rates" do
      rates = Fedex::Rates.get(credentials, quote_params)

      expect(rates).to be_an(Array)
      expect(rates).not_to be_empty
      expect(rates.first).to include("price", "currency", "service_level")
    end
  end
end
```

6. Ejecuta las pruebas con `bundle exec rspec`.

Esta es una prueba básica para asegurarte de que el método `get` devuelve un array de tarifas de envío. Dependiendo de tus necesidades, puedes añadir más pruebas para cubrir casos adicionales o para probar las funciones auxiliares, como `build_xml_request` y `parse_xml_response`. Sin embargo, dado que estas funciones son privadas y no están expuestas directamente al usuario, es posible que prefieras centrarte en probar la funcionalidad expuesta en lugar de las funciones internas.

---

🙋 **You:**

Invalid gemspec in [fedex_rates.gemspec]: uninitialized constant Gem::Specification::Fedex

---

🤖 **Assistant:**

Mis disculpas por el error. Parece que hay un problema en el archivo `fedex_rates.gemspec`. Por favor, asegúrate de que el archivo `fedex_rates.gemspec` tenga una estructura similar a la siguiente:

```ruby
# fedex_rates.gemspec
require_relative "lib/fedex_rates/version"

Gem::Specification.new do |s|
  s.name        = "fedex_rates"
  s.version     = FedexRates::VERSION
  s.authors     = ["Your Name"]
  s.email       = ["your.email@example.com"]
  s.summary     = "A Ruby gem to fetch shipping rates from FedEx"
  s.description = "A Ruby gem that connects to the FedEx Web Service API to fetch shipping rates based on the provided shipment information."
  s.homepage    = "https://github.com/your_username/fedex_rates"
  s.license     = "MIT"

  s.files       = Dir["{lib}/**/*"] + ["LICENSE", "README.md"]
  s.require_paths = ["lib"]

  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  s.add_dependency "nokogiri", "~> 1.12.5"
  s.add_dependency "httparty", "~> 0.18.1"

  s.add_development_dependency "bundler", "~> 2.1"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec", "~> 3.10"
end
```

Esta estructura debería evitar el error que estás experimentando. Asegúrate de ajustar los campos `authors`, `email`, `homepage` y cualquier otro campo necesario según tus necesidades.

---

🙋 **You:**

Es posible hacer un mock para no tener que usar la api?

---

🤖 **Assistant:**

Sí, es posible crear un mock para evitar hacer llamadas reales a la API de FedEx durante las pruebas. Puedes utilizar la gema `webmock` en combinación con `RSpec` para lograr esto. Aquí hay un ejemplo de cómo hacerlo:

1. Añade `webmock` como una dependencia de desarrollo en tu archivo `fedex_rates.gemspec`:

```ruby
# fedex_rates.gemspec
# ...
s.add_development_dependency "webmock", "~> 3.15"
```

2. Instala la nueva dependencia ejecutando `bundle install`.

3. Requiere `webmock` en tu archivo `spec/spec_helper.rb` y configura `RSpec` para habilitar `webmock`:

```ruby
# spec/spec_helper.rb
require "webmock/rspec"

RSpec.configure do |config|
  # ...
  config.before(:each) do
    # Aquí puedes configurar tus opciones de webmock
  end
end
```

4. Crea un mock en tu archivo de prueba `spec/fedex_rates_spec.rb` antes de la prueba:

```ruby
# spec/fedex_rates_spec.rb
require "spec_helper"
require "fedex_rates"
require "webmock/rspec"

RSpec.describe Fedex::Rates do
  # ...

  before(:each) do
    # URL del servicio de tarifas de FedEx
    api_url = "https://wsbeta.fedex.com:443/xml"

    # Respuesta XML de ejemplo para el mock
    response_xml = <<-XML
      <?xml version="1.0"?>
      <RateReply xmlns="http://fedex.com/ws/rate/v13">
        <!-- Aquí iría el contenido de la respuesta XML de la API de FedEx -->
      </RateReply>
    XML

    # Configura el mock para interceptar las solicitudes a la API de FedEx
    stub_request(:post, api_url).to_return(status: 200, body: response_xml)
  end

  # ...
end
```

Esta configuración interceptará las solicitudes POST a `https://wsbeta.fedex.com:443/xml` y devolverá la respuesta XML que especifiques en `response_xml`. Puedes personalizar `response_xml` para que coincida con la respuesta que esperas de la API de FedEx. De esta manera, no se realizará una llamada real a la API de FedEx durante las pruebas.

Ahora, cuando ejecutes tus pruebas con `bundle exec rspec`, las llamadas a la API de FedEx se interceptarán y se devolverá la respuesta XML especificada en lugar de hacer una llamada real a la API. Esto hace que las pruebas sean más rápidas y no dependan de la disponibilidad de la API de FedEx.