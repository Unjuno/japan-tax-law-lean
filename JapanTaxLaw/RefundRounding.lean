import JapanTaxLaw.TaxFinance

/-!
# RefundRounding — 国税庁関係政令 art.120（還付金等の端数計算等）bounded L4 モデル

Sources (pinned):
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Raw snapshot: data/raw/337AC0000000066_20261101_507AC0000000013.law.json
  Article Num 120, flat/normalized leaf text 242 chars, U+3000 count 0.

原文逐語:
  §1 「還付金等の額に一円未満の端数があるときは、その端数金額を切り捨てる。」
  §2 「還付金等の額が一円未満であるときは、その額を一円として計算する。」
  §3 「還付加算金の確定金額に百円未満の端数があるとき、又はその全額が千円未満である
       ときは、その端数金額又はその全額を切り捨てる。」
  §4 「還付金等の額を計算する場合において、その計算の基礎となる還付金等の額に
       一万円未満の端数があるとき、又はその還付金等の額の全額が一万円未満である
       ときは、その端数金額又はその全額を切り捨てる。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  金額を scal 分の 1 単位のスケール整数 scaled（caller-established、scal > 0）で表す。
  §1: 一円未満切り捨て = scaled / scal（円未満端数を落とす）。
  §2: 一円未満（=0 円だが scaled>0）なら 1 円として計算。
  §3: 還付加算金 = 百円未満切り捨て、かつ全額千円未満なら 0。
  §4: 基礎額 = 一万円未満切り捨て、かつ全額一万円未満なら 0。

Scope: 還付金等の額・還付加算金の確定金額は caller-established。
還付加算金の利率・期間の算定は NOT MODELLED。
-/

namespace JapanTaxLaw.RefundRounding

open JapanTaxLaw.TaxFinance

/-- §1: 一円未満の端数を切り捨てた円額 = scaled / scal。
    scal > 0 は caller-established（scal = 0 は Nat 除算の定義で 0 を返す安全版）。 -/
def truncateYen (scaled scal : Money) : Money := scaled / scal

/-- §2: 還付金等の額。一円未満（円額 0 だが端数あり）なら 1 円、端数なければ切り捨て円額。 -/
def refundAmount (scaled scal : Money) : Money :=
  let yen := scaled / scal
  if yen = 0 ∧ scaled ≠ 0 then 1 else yen

/-- §3: 還付加算金。百円未満切り捨て、全額千円未満なら 0。 -/
def additionAmount (yen : Money) : Money :=
  if yen < 1000 then 0 else yen - yen % 100

/-- §4: 還付加算金計算の基礎額。一万円未満切り捨て、全額一万円未満なら 0。 -/
def baseForAddition (yen : Money) : Money :=
  if yen < 10000 then 0 else yen - yen % 10000

-- ==== kernel-decided smoke ====
example : truncateYen 12345 10 = 1234 := by decide
example : refundAmount 12345 10 = 1234 := by decide
example : refundAmount 5 10 = 1 := by decide   -- 一円未満 → 1 円
example : refundAmount 0 10 = 0 := by decide
example : additionAmount 999 = 0 := by decide
example : additionAmount 1000 = 1000 := by decide
example : additionAmount 12345 = 12300 := by decide
example : baseForAddition 9999 = 0 := by decide
example : baseForAddition 10000 = 10000 := by decide
example : baseForAddition 123456 = 120000 := by decide

end JapanTaxLaw.RefundRounding
