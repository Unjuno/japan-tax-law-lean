import JapanTaxLaw.TaxFinance

/-!
# LocalGrantTaxShares — 地方交付税法 art.6の2 §2/§3 普通交付税94%・特別交付税6%（bounded L4 モデル）

Sources (pinned):
  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062
  Raw snapshot: data/raw/325AC0000000211_20261102_508AC0000000062.law.json

原文逐語（別々の項）:
  §2 「毎年度分として交付すべき普通交付税の総額は、前条第二項の額の百分の九十四に相当する額とする。」
  §3 「毎年度分として交付すべき特別交付税の総額は、前条第二項の額の百分の六に相当する額とする。」

Computation（原文の二つの割合のみ、単位: 円、Nat の下限切り捨て）:
  ordinaryShare(total) = total * 94 / 100
  specialShare(total)  = total * 6 / 100

Scope / NOT MODELLED:
  - 前条第二項の額（交付税総額）そのものの算定、基準財政需要額・基準財政収入額は NOT MODELLED。
  - 端数処理、附則（令和八・九年度の特例）、臨時財政対策債、交付手続、地方公共団体間の配分は NOT MODELLED。
  - 本モデルは所与の total に対する二つの割合のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalGrantTaxShares

open JapanTaxLaw.TaxFinance

/-- 普通交付税の割合（百分の九十四）。 -/
def ordinaryRateNum : Nat := 94

/-- 特別交付税の割合（百分の六）。 -/
def specialRateNum : Nat := 6

/-- 両者に共通の分母（百）。 -/
def rateDen : Nat := 100

/-- 普通交付税の総額 = 前条第二項の額 × 94/100。 -/
def ordinaryShare (total : Money) : Money :=
  total * ordinaryRateNum / rateDen

/-- 特別交付税の総額 = 前条第二項の額 × 6/100。 -/
def specialShare (total : Money) : Money :=
  total * specialRateNum / rateDen

example : ordinaryShare 0 = 0 := by decide
example : ordinaryShare 1 = 0 := by decide
example : ordinaryShare 10_000 = 9_400 := by decide
example : ordinaryShare 93 = 87 := by decide
example : ordinaryShare 100 = 94 := by decide
example : specialShare 1 = 0 := by decide
example : specialShare 10_000 = 600 := by decide
example : specialShare 100 = 6 := by decide

end JapanTaxLaw.LocalGrantTaxShares
