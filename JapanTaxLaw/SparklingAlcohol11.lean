import JapanTaxLaw.TaxFinance

/-!
# SparklingAlcohol11 — 酒税法 art. 3（発泡性酒類 アルコール分 十一度未満）

Sources (pinned):

  Law id: 328AC0000000006
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json

Pinned 原文: 「イ及びロに掲げる酒類以外の酒類で発泡性を有するもの（アルコール分が十一度未満のものに限る。以下「その他の発泡性酒類」という。）」

Scoped claim: only the 発泡性酒類 アルコール分 十一度未満 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.SparklingAlcohol11

def alcoholLimit11 : Nat := 11

def isSparklingUnder11 (x : Nat) : Bool :=
  decide (x < alcoholLimit11)

theorem threshold_value : alcoholLimit11 = 11 := rfl

end JapanTaxLaw.SparklingAlcohol11
