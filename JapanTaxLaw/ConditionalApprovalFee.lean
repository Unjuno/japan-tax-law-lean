import JapanTaxLaw.TaxFinance

/-
# ConditionalApprovalFee — コンテナーに関する通関条約…法律施行令 art.17（コンテナーの承認手数料）条件付き手数料 L4 モデル

Pinned:
  Law id: 346CO0000000257 (CabinetOrder)
  Revision: 346CO0000000257_20171008_428CO0000000240
  Raw snapshot: data/raw/346CO0000000257_20171008_428CO0000000240.law.json
  SHA-256: 24fe53fb7ff3bb0a896e8110ead0fab89807e8ea9c62ccc1472e5b12771b4c74
  Article Num 17, ArticleCaption（コンテナーの承認手数料）.

原文逐語（第十七条 第二号・型式承認）:
  「当該承認一件ごとに十二万七百円（電子申請の場合にあつては、十一万千八百円）」

Variable contract:
  electronic : Bool — 電子情報処理組織を使用して申請を行なう場合（電子申請）かどうか。
  standardFee / electronicFee : Nat — 円、一件ごとの承認手数料。
  feeFor — 申請形態で手数料を選択する Bool 選択型（しきい値・比率ではない）。

Scope: 明示された条件付き手数料構造（標準 120,700 円／電子申請 111,800 円、一件ごと）
のみを扱う。第一号（九千三百円／八千七百円）、徴収手続、他の条文・号は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ConditionalApprovalFee

/-- 標準の承認手数料（一件ごと）= 十二万七百円。 -/
def standardFee : Nat := 120_700

/-- 電子申請の承認手数料（一件ごと）= 十一万千八百円。 -/
def electronicFee : Nat := 111_800

/-- 申請形態で手数料を選択する。電子申請なら electronicFee、それ以外は standardFee。 -/
def feeFor (electronic : Bool) : Nat :=
  if electronic then electronicFee else standardFee

theorem feeFor_true : feeFor true = 111_800 := by decide
theorem feeFor_false : feeFor false = 120_700 := by decide
theorem electronicFee_lt_standardFee : electronicFee < standardFee := by decide
theorem standardFee_value : standardFee = 120_700 := rfl
theorem electronicFee_value : electronicFee = 111_800 := rfl

end JapanTaxLaw.ConditionalApprovalFee
