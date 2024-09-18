object maquina {

    const produccion = []
    method algunDiaSeProdujo(cantidad) = produccion.contains(cantidad)

    method producir(cant){
      produccion.add(cant)
    }
    method totalProducido() = produccion.sum()
    method maximoValorDeProduccion() = produccion.max()
    method ultimoValorDeProduccion() = produccion.last()

    method produccionesSuperioresA(valor) 
       = produccion.filter( {elemento=> elemento > valor } ) 

    method cantidadProduccionesMayorALaPrimera() = produccion.count({elem => elem > produccion.first()})

    method produccionEsAcotada(n1,n2) = produccion.all({e => e.between(n1,n2)})
    method incendio(){
      produccion.clear()
    }
    method produccionesPares() = produccion.filter{p=>p.even()}

    method corregirRegistro(valorViejo,valorNuevo){
      produccion.remove(valorViejo)
      produccion.add(valorNuevo)
    }
    method promedio() = self.totalProducido() / produccion.size()

    method produccionesSumando(cant) = produccion.map{p=> p + cant}
  }


object bizcocho{
  method cantidad() = 100
}

object factura{
  method cantidad() = 12
}

object pan{
  var cantidad = 5
  method cantidad() = cantidad
}

object sanguchito{
  var esDeMiga = true

  method cantidad() = if (esDeMiga) 10 else 24
}

