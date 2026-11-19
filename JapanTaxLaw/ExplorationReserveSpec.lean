import JapanTaxLaw.ExplorationReserve

/-!
# ExplorationReserve spec — 租税特別措置法施行規則 art.9 の独立整数定式

Sources (pinned; identical to ExplorationReserve.lean):
  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Article Num 9.

Independent integer restatement (coordinator の数式は信じず原文から直接):
  * 「販売収入金額（鉱物等がある場合は取得金額を控除した金額）」= sales − acquisition (saturating)。
  * 「第一号額が第二号額のうちに占める割合を乗じて計算した金額」= base × first / second。
    分母 0 は安全版として 0。

Spec は impl の def を参照せず、原文から直接書いた整数式のみを使う。
Scope boundaries identical to the implementation。
-/

namespace JapanTaxLaw.ExplorationReserve

/-- Spec: 正味売上 = sales − acquisition（Nat 減算は saturating）。 -/
def specNet (sales acquisition : Nat) : Nat := sales - acquisition

/-- Spec: 探鉱準備金 = base × first / second（分母 0 → 0）。 -/
def specReserve (sales acquisition first second : Nat) : Nat :=
  let base := specNet sales acquisition
  if second = 0 then 0 else base * first / second

-- ==== spec smoke (kernel-decided) ====
example : specNet 100 150 = 0 := by decide
example : specNet 100 40 = 60 := by decide
example : specReserve 1000 0 1 2 = 500 := by decide
example : specReserve 1000 200 1 2 = 400 := by decide
example : specReserve 100 0 1 3 = 33 := by decide
example : specReserve 1000 0 5 0 = 0 := by decide

/-- Agreement between impl and Spec on a finite grid（定数値一致、有限グリッド、by decide）。 -/
def agreeExplorationReserve : Bool :=
  [ (1000, 0, 1, 2), (1000, 200, 1, 2), (100, 0, 1, 3),
    (1000, 0, 5, 0), (100, 150, 1, 2), (0, 0, 1, 1),
    (999_999, 12_345, 7, 11), (500, 500, 3, 4) ].all fun (s, a, f, sec) =>
    explorationReserve s a f sec == specReserve s a f sec

example : agreeExplorationReserve = true := by decide

end JapanTaxLaw.ExplorationReserve
