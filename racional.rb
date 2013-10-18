# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion
  
        attr_accessor :num,:denom
  
	
	
	#hacemos la reduccion de las fracciones
	def minimizar(a,b)
                mcd = gcd(a,b)
                aux = Fraccion.new(1,1)
                aux.num = a/mcd
                aux.denom = b/mcd
                return aux
        end
	
	
	#Inicializacion
	def initialize(num,denom)
                @num=num
                if(denom==0)		#si el denominador es 0
                        @denom=1        	#lo convertimos en 1
                else
                        @denom=denom
                end
        end
                
	# devuelve una cadena con la representación del racional
        def to_s
                aux=Fraccion.new(num, denom)
                aux=minimizar(aux.num, aux.denom)
                "#{aux.num} / #{aux.denom}"
        end

	 # devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parámetro
        def suma(x)
                aux=Fraccion.new(1,1)
                m = mcm(self.denom, x.denom)
                aux.num=(self.num*m/self.denom)+(x.num*m/x.denom)
                aux.denom=m
                aux=minimizar(aux.num, aux.denom)
                return aux
        end

	 # devuelve un nuevo racional que resta al objeto que invoca el que le pasan como parámetro 
        def resta(x)
                aux=Fraccion.new(1,1)
                m = mcm(self.denom, x.denom)
                aux.num=(self.num*m/self.denom)-(x.num*m/x.denom)
                aux.denom=m
                aux=minimizar(aux.num, aux.denom)
                return aux
        end        

	# devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
        def producto(x)
                aux=Fraccion.new(1,1)
                aux.num=self.num*x.num
                aux.denom=self.denom*x.denom
                aux=minimizar(aux.num, aux.denom)
                return aux
        end

	# devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
        def division(x)
                aux=Fraccion.new(1,1)
                aux.num=self.num*x.denom
                aux.denom=self.denom*x.num
                aux=minimizar(aux.num, aux.denom)
                return aux
        end

        def mcm(a,b)
                (a*b)/gcd(a,b)
        end


end




a=Fraccion.new(4,2)
b=Fraccion.new(5,0)

puts a.to_s
puts b.to_s

puts (a.suma b).to_s
puts (a.resta b).to_s
puts (a.producto b).to_s
puts (a.division b).to_s


