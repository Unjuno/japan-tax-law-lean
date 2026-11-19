import JapanTaxLaw.RefundRounding

/-!
# RefundRounding spec — 国税庁関係政令 art.120 の独立整数定式
Sources (pinned): law 337AC0000000066, revision 337AC0000000066_20261101_507AC0000000013.
Independent restatement: §1 円未満切捨て、§2 一円未満は一円、§3 百円未満切捨てかつ千円未満は0、§4 一万円未満切捨てかつ一万円未満は0。
-/

namespace JapanTaxLaw.RefundRounding

def specRefund (scaled scal : Nat) : Nat :=
  let yen := scaled / scal
  if yen = 0 ∧ scaled ≠ 0 then 1 else yen

def specAddition (yen : Nat) : Nat := if yen < 1000 then 0 else yen - yen % 100
def specBase (yen : Nat) : Nat := if yen < 10000 then 0 else yen - yen % 10000

example : specRefund 12345 10 = 1234 := by decide
example : specRefund 5 10 = 1 := by decide
example : specAddition 12345 = 12300 := by decide
example : specBase 123456 = 120000 := by decide

def agreeRefundRounding : Bool :=
  [ (0,10), (5,10), (9,10), (10,10), (12345,10), (999999,3) ].all fun (scaled, scal) =>
    refundAmount scaled scal == specRefund scaled scal
  && [0, 999, 1000, 12345].all fun y => additionAmount y == specAddition y
  && [0, 9999, 10000, 123456].all fun y => baseForAddition y == specBase y
example : agreeRefundRounding = true := by decide

end JapanTaxLaw.RefundRounding
