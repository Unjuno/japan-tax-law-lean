import JapanTaxLaw.TaxFinance

/-
# Gradation256Floor — 電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則 第二条(6)(2)イ(二)
（赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上）

Pinned source:
  Law id: 410M50000040043
  Official title: 電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則
  Law type: MinisterialOrdinance (省令)
  Revision: 410M50000040043_20250401_507M60000040028
  Raw snapshot: data/raw/410M50000040043_20250401_507M60000040028.law.json
  sha256: 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44
  Statutory article: 第二条 (art. 2), 第六項 (6), 第二号 (2), イ, 二
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/
               Paragraph#6/Item#2/Subitem1#1/Subitem2#2/Subitem2Sentence/Sentence#1
  Normative unit id: NORM|f99be74c91690ed7e64d9df9919b260bb873b5750e0dc4574e67886b2e23416c

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上で読み取るものであること。」

Variable contract:
  `gradationFloor : Nat := 256` = 二百五十六階調 (inclusive lower bound: 以上).
  `meetsGradationFloor (levels : Nat) : Bool := decide (gradationFloor <= levels)`.
  Unit 階調 (gradation levels); domain Nat. 「以上」 = inclusive `>=`.

Scope: ONLY this explicit numeric gradation condition for one channel is
modelled. The conjunction across the three channels (赤/緑/青), the scanning
and record-keeping requirements this condition gates, the other items/subitems,
and all enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.Gradation256Floor

/-- 二百五十六階調 — inclusive lower bound (以上). Unit 階調; domain Nat. -/
def gradationFloor : Nat := 256

/-- 「階調が二百五十六階調以上」: levels >= 256. -/
def meetsGradationFloor (levels : Nat) : Bool :=
  decide (gradationFloor <= levels)

/-- 以上 is inclusive: exactly 256 qualifies. -/
theorem floor_inclusive : meetsGradationFloor 256 = true := by
  unfold meetsGradationFloor gradationFloor
  decide

/-- One below the floor fails. -/
theorem just_below : meetsGradationFloor 255 = false := by
  unfold meetsGradationFloor gradationFloor
  decide

/-- Zero gradation levels do not satisfy the condition. -/
theorem zero_false : meetsGradationFloor 0 = false := by
  unfold meetsGradationFloor gradationFloor
  decide

end JapanTaxLaw.Gradation256Floor
