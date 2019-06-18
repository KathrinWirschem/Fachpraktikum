#d-th power residue symbol, Jacobi version
#(a/b)_d, d|q-1, F_q

function power_residue(a,b,d,symbol,q)
  q = Int(q)

  if b==0 ||a==0
    return error("a,b!=0")
  end

  if gcd(a,b)!=1
    a_b_d = 0
    return a_b_d
  end

  a = mod(a,b)                                          #oberen Teil reduzieren

  if degree(a)==0                                       #oben konstant -> Formel
    return a^( div((q-1),d) * Int(degree(b)) )
  end

  #oben und unten tauschen -> rekursiver Aufruf (allgemeines Reziprozitaetsgesetz)
  exp = div(q-1,d)
  symbol = (-1)^Int( div(q-1, d) * degree(a) * degree(b) ) * leading_coefficient(a^exp)^Int(degree(b)) * leading_coefficient(b^exp)^Int(-degree(a)) * power_residue(b,a,d,1,q)

  return symbol

end
