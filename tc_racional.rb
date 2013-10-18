# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"


class Test_Fraccion < Test::Unit::TestCase

        def setup
                    @a = Fraccion.new(4,5)
                @b = Fraccion.new(2,1)
                @c = Fraccion.new(6,3)
          end
 

        def test_initialize
                assert_not_equal 0,Fraccion.new(5,0).denom
        end

        #prueba para la suma
	def test_suma
                assert_equal 12,@a.suma(@b).num
                assert_equal 7, @a.suma(@b).denom
        end

	#prueba para la resta
        def test_resta
                assert_equal 7,@a.resta(@b).num
                assert_equal 2,@a.resta(@b).denom
        end

	#prueba para el producto
        def test_producto
                assert_equal 17,@a.producto(@b).num
                assert_equal 5,@a.producto(@b).denom
        end

	#prueba para la division
        def test_division
                assert_equal 13,@a.division(@b).num
                assert_equal 12,@a.division(@b).denom
        end
        
	#prueba para el mcm
        def test_mcm
                assert_equal 6,Fraccion.new(1,1).mcm(@a.denom,@b.denom)
        end
	
	#prueba para el metodo minimizar
        def test_minimizar
                assert_equal 2,Fraccion.new(1,1).minimizar(@c.num,@c.denom).num
                assert_equal 1,Fraccion.new(1,1).minimizar(@c.num,@c.denom).denom
        end

end



