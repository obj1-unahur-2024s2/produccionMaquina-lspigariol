object maquina {

    const produccion = []
    method algunDiaSeProdujo(cantidad) = produccion.contains(cantidad)

    method producir(cant){
      produccion.add(cant)
    }
  }