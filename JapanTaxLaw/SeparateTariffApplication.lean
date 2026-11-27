import JapanTaxLaw.TaxFinance

/-
# SeparateTariffApplication — 関税定率法 第五条（特定貨物の一般関税・報復関税の別個適用）

Sources (pinned):

  Law id: 417CO0000000289
  Revision: 417CO0000000289_20130901_425CO0000000238
  Raw snapshot: data/raw/417CO0000000289_20130901_425CO0000000238.law.json
  SHA-256: 3bc5cd636935332e9adb010e60eb07a97ffc273c2027d2e04c6e0318968d8a6d (23,840 bytes)
  Article caption / title: （関税法の適用） / 第五条
  Scoped article text (62 chars, verbatim):
    「（関税法の適用）第五条特定貨物に課する一般関税及び報復関税については、それぞれ別個の関税として関税法第二章の規定を適用する。」
  Pinned needle (51 chars, verbatim in scoped Article 5):
    「特定貨物に課する一般関税及び報復関税については、それぞれ別個の関税として関税法第二章の規定を適用する。」

Scoped claim: a distinct EFFECT norm — EXCLUSIVITY / PARALLEL APPLICATION of
two separate tariffs. The general tariff (一般関税) and the retaliatory tariff
(報復関税) on the SAME specific goods are EACH applied separately
(それぞれ別個の関税として): never merged, never alternatives. Each is computed
under the same Customs Law chapter-2 rules (関税法第二章の規定を適用する).

Variable contract:
  generalTariff     = 一般関税額 (Nat, 円), caller-established under chapter-2 rules
  retaliatoryTariff = 報復関税額 (Nat, 円), caller-established under chapter-2 rules
  result            = 合計課される関税額 (Nat, 円) = generalTariff + retaliatoryTariff

`chapterRef : Nat := 2` encodes the STRUCTURAL cross-reference 第二章 (an
article-to-chapter pointer), NOT a substantive rate or threshold; the only
spec literal is 2 (kanji 二 in 第二章) and parse_statutory_rate is None.

Out of scope: the chapter-2 tariff computation itself, goods classification
(特定貨物の認定), and the retaliation decision — all caller-established.
-/

namespace JapanTaxLaw.SeparateTariffApplication

def chapterRef : Nat := 2

def appliedSeparately : Bool := true

def totalTariff (generalTariff : Nat) (retaliatoryTariff : Nat) : Nat :=
  generalTariff + retaliatoryTariff

theorem chapterRef_value : chapterRef = 2 := rfl
theorem appliedSeparately_value : appliedSeparately = true := rfl
theorem totalTariff_0_0 : totalTariff 0 0 = 0 := by decide
theorem totalTariff_100_50 : totalTariff 100 50 = 150 := by decide
theorem totalTariff_1_2 : totalTariff 1 2 = 3 := by decide
theorem totalTariff_7_0 : totalTariff 7 0 = 7 := by decide

end JapanTaxLaw.SeparateTariffApplication
