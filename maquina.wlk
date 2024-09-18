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

////////////////// Nueva maquina: en la panaderia

object horno {

    const produccion = []
    method algunDiaSeProdujo(cantidad) = produccion.any{e=>e.cantidad() == cantidad}

    method producir(producto){
      produccion.add(producto)
    }
    method totalProducido() = produccion.sum({p=>p.cantidad() })
    method maximoValorDeProduccion() = produccion.max({p=>p.cantidad()})
    method ultimoValorDeProduccion() = produccion.last()

    method produccionesQueCuestanMasQue(valor) 
       = produccion.filter( {elemento=> elemento.precio() > valor } ) 

    method cantidadProduccionesMayorALaPrimera() = produccion.count({elem => elem.cantidad() > produccion.first().cantidad()})

    method produccionEsAcotada(n1,n2) = produccion.all({e => e.cantidad().between(n1,n2)})
    method incendio(){
      produccion.clear()
    }
    method produccionesAptoCeliaco() = produccion.filter{p=>p.esAptoCeliaco()}

    method elPrimeroParaCeliaco() = produccion.find{p=>p.esAptoCeliaco()}

    method corregirRegistro(valorViejo,valorNuevo){
      produccion.remove(valorViejo)
      produccion.add(valorNuevo)
    }
    method promedio() = self.totalProducido() / produccion.size()

    method produccionesSumando(cant) = produccion.map{p=> p.cantidad() + cant}

  }


object bizcocho{
  method cantidad() = 100
  method precio() = 10 
  method esAptoCeliaco() = true

}

object factura{
  method cantidad() = 12
  method precio() = 0
    method esAptoCeliaco() = false

}

object pan{
  var cantidad = 5
  method cantidad() = cantidad
  method precio() = cantidad * 10
  method esAptoCeliaco() = cantidad < 1

}

object sanguchito{
  var esDeMiga = true

  method cantidad() = if (esDeMiga) 10 else 24
  method precio() = pan.precio()*2 + 10
  method esAptoCeliaco() = not esDeMiga
}

object remera{
  method color() = "celeste"
}

