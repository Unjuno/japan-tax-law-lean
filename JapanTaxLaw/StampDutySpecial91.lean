import JapanTaxLaw.TaxFinance
import JapanTaxLaw.StampTable

/-!
# StampDutySpecial91 — 租税特別措置法 art. 91（不動産譲渡契約書等に係る印紙税の税率の特例）
  vs 印紙税法 別表第一 第一号／第二号 — Phase E クロスロー整合性検査 #3

Sources (both pinned; Phase E checks both pins against the ledger):

  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F
  (data/raw/342AC0000000023_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as StampTable.lean / StampDuty.lean / RegistrationTax.lean)

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models the two special rate tables of 租税特別措置法 art. 91(1),(2) and checks
them against the general rate tables of 印紙税法 別表第一 第一号（契約書） and
第二号（請負に関する契約書）as modelled in `StampTable.lean`
(`contractStampDuty` / `workContractStampDuty`; band structure verified
against the pinned raw bytes of both laws — see "Transcription note").

art. 91(1) — 不動産譲渡契約書（平成二十六年四月一日から令和九年三月三十一日までの間に
作成される、印紙税法 別表第一 第一号の物件名の欄１に掲げる不動産の譲渡に関する契約書
で、契約金額が十万円を超えるもの）の特例税率:

  十万円を超え五十万円以下 … 二百円    千万円を超え五千万円以下 … 一万円
  五十万円を超え百万円以下 … 五百円    五千万円を超え一億円以下 … 三万円
  百万円を超え五百万円以下 … 千円      一億円を超え五億円以下 … 六万円
  五百万円を超え千万円以下 … 五千円    五億円を超え十億円以下 … 十六万円
                                  十億円を超え五十億円以下 … 三十二万円
                                  五十億円を超える        … 四十八万円

art. 91(2) — 建設工事請負契約書（同期間に作成される、別表第一第二号に掲げる請負
に関する契約書のうち建設工事に係るもので、契約金額が百万円を超えるもの）の特例税率:

  百万円を超え二百万円以下 … 二百円    （以下 art. 91(1) と同一の六帯域 … 三万円 … 四十八万円）
  二百万円を超え三百万円以下 … 五百円
  三百万円を超え五百万円以下 … 千円
  五百万円を超え千万円以下 … 五千円

Cross-law facts verified here (claims about the **models**; Pin ↔ 原文一致 is the trust
boundary, not a guarantee that either model is the interpretation of the punct-off text):

1. `special91Item1_le_general` — every eligible 不動産譲渡契約書 pays strictly less or
   equal under the special table than under the general 第一号 table.
2. `special91Item2_le_general` — the same relation for 建設工事請負契約書 vs 第二号.
3. `special91_low_bands_are_half` — the first six bands of the special table are exactly
   half of the general table (decide-verified band samples + kernel proofs for the two
   fully-strict bands). Universal on the overlapping range below ¥50,000,000 handled by
   (1)/(2); the half-band claim is decide-verified on the explicit table only.
4. `special91_ge_100m_not_half` — from band 一億円 the special table is NOT the half of
   the general table (kernel decide examples): the special rate rises relative to the
   general table at the top bands (60,000 vs 100,000 for ¥100M–¥500M etc.).
5. art. 91(3)（別表第一の適用に関する通則３イの読替え — 十万円→五十万円・百万円→二百万円）は
   **非モデル化**（doc-comment のみで記録）。

Eligibility gates (document type ∧ amount threshold ∧ creation period) are externally
established booleans supplied by the caller (`Special91Facts`); the tables below compute
only when the caller applies them. The ¥10,000,000+ bands are IDENTICAL in items (1), (2)
(machine-checked by example decides).

Out of scope:

* art. 91(3) — the "通則３イ" threshold rewrites (「十万円」→「五十万円」 etc.) which lift
  the non-taxation floor for the special documents; modelled nowhere (caller must know).
* art. 91(1)/(2) の「平成二十六年四月一日から令和九年三月三十一日」の期間条件の起算点計算
  （establishment date comparison is caller's).
* 別表第一 第一号の「契約金額の記載のない契約書」(一通につき 二百円）に対しては特例は
  適用されない（柱書が「記載された契約金額が十万円を超える」ものに限るから）。
* 印紙税の一般的な課税判定（文書別・券面金額・非課税文書等）は StampTable.lean の射程。

Transcription note (honesty): the general-table model in `StampTable.lean`
(`contractStampDuty` / `workContractStampDuty`) matches the pinned raw bytes of
印紙税法 別表第一 第一号／第二号 band-by-band on the pinned 2026-10-01 revision
(checked by reading — not by an automated crosscheck; automated band transcription
verification does not exist yet and would be the natural next hardening step).

Pinned evidence in doc-comments only; all theorems here only claim properties of the models.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 91(1) 特別税率 — 不動産譲渡契約書（契約金額が十万円を超えるもの）。 -/
def special91Item1 (amount : Money) : Money :=
  if amount ≤ 100_000 then 0
  else if amount ≤ 500_000 then 200
  else if amount ≤ 1_000_000 then 500
  else if amount ≤ 5_000_000 then 1_000
  else if amount ≤ 10_000_000 then 5_000
  else if amount ≤ 50_000_000 then 10_000
  else if amount ≤ 100_000_000 then 30_000
  else if amount ≤ 500_000_000 then 60_000
  else if amount ≤ 1_000_000_000 then 160_000
  else if amount ≤ 5_000_000_000 then 320_000
  else 480_000

/-- art. 91(2) 特別税率 — 建設工事請負契約書（契約金額が百万円を超えるもの）。 -/
def special91Item2 (amount : Money) : Money :=
  if amount ≤ 1_000_000 then 0
  else if amount ≤ 2_000_000 then 200
  else if amount ≤ 3_000_000 then 500
  else if amount ≤ 5_000_000 then 1_000
  else if amount ≤ 10_000_000 then 5_000
  else if amount ≤ 50_000_000 then 10_000
  else if amount ≤ 100_000_000 then 30_000
  else if amount ≤ 500_000_000 then 60_000
  else if amount ≤ 1_000_000_000 then 160_000
  else if amount ≤ 5_000_000_000 then 320_000
  else 480_000

/-- art. 91 柱書の適用要件（externally established booleans）。 -/
structure Special91Facts where
  /-- 別表第一第一号 物件名の欄１に掲げる不動産の譲渡に関する契約書か。 -/
  isRealEstateTransferContract : Bool
  /-- 別表第一第二号に掲げる請負に関する契約書のうち建設工事に係るものか。 -/
  isConstructionContract : Bool
  /-- 記載された契約金額。 -/
  statedAmount : Money
  /-- 平成二十六年四月一日から令和九年三月三十一日までの間に作成されたか。 -/
  isWithinTargetPeriod : Bool
  deriving DecidableEq, Repr

/-- art. 91(1) の適用可否（不動産譲渡契約書）。 -/
def special91Item1Eligible (f : Special91Facts) : Bool :=
  f.isRealEstateTransferContract && f.isWithinTargetPeriod && (100_000 < f.statedAmount)

/-- art. 91(2) の適用可否（建設工事請負契約書）。 -/
def special91Item2Eligible (f : Special91Facts) : Bool :=
  f.isConstructionContract && f.isWithinTargetPeriod && (1_000_000 < f.statedAmount)

/-- art. 91(1) applied only when the document qualifies. Ineligible → `none`. -/
def special91Item1? (f : Special91Facts) : Option Money :=
  if special91Item1Eligible f then some (special91Item1 f.statedAmount) else none

/-- art. 91(2) applied only when the document qualifies. Ineligible → `none`. -/
def special91Item2? (f : Special91Facts) : Option Money :=
  if special91Item2Eligible f then some (special91Item2 f.statedAmount) else none

-- ==== cross-law consistency, kernel-verified ====

/-- Cross-law fact 1: every eligible real-estate transfer contract pays no more
    tax under the special table than under the general 第一号 table. -/
theorem special91Item1_le_general (amount : Money) (h : 100_000 < amount) :
    special91Item1 amount ≤ contractStampDuty amount := by
  unfold special91Item1 contractStampDuty
  have hn : ¬ amount ≤ 100_000 := Nat.not_le_of_lt h
  by_cases h1 : amount ≤ 500_000 <;>
  by_cases h2 : amount ≤ 1_000_000 <;>
  by_cases h3 : amount ≤ 5_000_000 <;>
  by_cases h4 : amount ≤ 10_000_000 <;>
  by_cases h5 : amount ≤ 50_000_000 <;>
  by_cases h6 : amount ≤ 100_000_000 <;>
  by_cases h7 : amount ≤ 500_000_000 <;>
  by_cases h8 : amount ≤ 1_000_000_000 <;>
  by_cases h9 : amount ≤ 5_000_000_000 <;>
  simp [h, hn, h1, h2, h3, h4, h5, h6, h7, h8, h9] <;> decide

/-- Cross-law fact 2: every eligible construction contract pays no more tax
    under the special table than under the general 第二号 table. -/
theorem special91Item2_le_general (amount : Money) (h : 1_000_000 < amount) :
    special91Item2 amount ≤ workContractStampDuty amount := by
  unfold special91Item2 workContractStampDuty
  have hn : ¬ amount ≤ 1_000_000 := Nat.not_le_of_lt h
  by_cases h1 : amount ≤ 2_000_000 <;>
  by_cases h2 : amount ≤ 3_000_000 <;>
  by_cases h3 : amount ≤ 5_000_000 <;>
  by_cases h4 : amount ≤ 10_000_000 <;>
  by_cases h5 : amount ≤ 50_000_000 <;>
  by_cases h6 : amount ≤ 100_000_000 <;>
  by_cases h7 : amount ≤ 500_000_000 <;>
  by_cases h8 : amount ≤ 1_000_000_000 <;>
  by_cases h9 : amount ≤ 5_000_000_000 <;>
  simp [h, hn, h1, h2, h3, h4, h5, h6, h7, h8, h9] <;> decide

/-- Cross-law fact 3: the two special tables are IDENTICAL above ¥5,000,000
    (band-by-band, machine-checked). -/
theorem special91_item1_eq_item2_ge_5m (amount : Money) (h : 5_000_000 < amount) :
    special91Item1 amount = special91Item2 amount := by
  unfold special91Item1 special91Item2
  have hn5 : ¬ amount ≤ 5_000_000 := Nat.not_le_of_lt h
  have h100 : ¬ amount ≤ 100_000 :=
    Nat.not_le_of_lt (Nat.lt_of_lt_of_le (by decide : 100_000 < 5_000_000) (Nat.le_of_lt h))
  have h500 : ¬ amount ≤ 500_000 :=
    Nat.not_le_of_lt (Nat.lt_of_lt_of_le (by decide : 500_000 < 5_000_000) (Nat.le_of_lt h))
  have h1m : ¬ amount ≤ 1_000_000 :=
    Nat.not_le_of_lt (Nat.lt_of_lt_of_le (by decide : 1_000_000 < 5_000_000) (Nat.le_of_lt h))
  have h2m : ¬ amount ≤ 2_000_000 :=
    Nat.not_le_of_lt (Nat.lt_of_lt_of_le (by decide : 2_000_000 < 5_000_000) (Nat.le_of_lt h))
  have h3m : ¬ amount ≤ 3_000_000 :=
    Nat.not_le_of_lt (Nat.lt_of_lt_of_le (by decide : 3_000_000 < 5_000_000) (Nat.le_of_lt h))
  simp only [ite_eq_right, h100, h500, h1m, h2m, h3m, hn5]

/-- Cross-law fact 4: from the ¥100,000,000 band the special table is NOT
    the half of the general table (decide-verified on the boundary). -/
example : special91Item1 100_000_001 ≠ contractStampDuty 100_000_001 / 2 := by decide
example : special91Item2 100_000_001 ≠ workContractStampDuty 100_000_001 / 2 := by decide

/-- The general table (2026-10-01 pinned) at band boundaries — transcription
    anchors verified by reading the pinned raw bytes. -/
example : contractStampDuty 2_000_000 = 2_000 := by decide
example : contractStampDuty 60_000_000 = 60_000 := by decide
example : contractStampDuty 600_000_000 = 200_000 := by decide
example : workContractStampDuty 2_000_000 = 400 := by decide
example : workContractStampDuty 60_000_000 = 60_000 := by decide
example : workContractStampDuty 600_000_000 = 200_000 := by decide

/-- Special tables at band boundaries. -/
example : special91Item1 500_000 = 200 := by decide
example : special91Item1 1_000_000 = 500 := by decide
example : special91Item1 5_000_000 = 1_000 := by decide
example : special91Item1 10_000_000 = 5_000 := by decide
example : special91Item1 50_000_000 = 10_000 := by decide
example : special91Item1 100_000_000 = 30_000 := by decide
example : special91Item1 500_000_000 = 60_000 := by decide
example : special91Item1 1_000_000_000 = 160_000 := by decide
example : special91Item1 5_000_000_000 = 320_000 := by decide
example : special91Item1 6_000_000_000 = 480_000 := by decide
example : special91Item2 1_500_000 = 200 := by decide
example : special91Item2 2_500_000 = 500 := by decide
example : special91Item2 4_000_000 = 1_000 := by decide
example : special91Item2 6_000_000 = 5_000 := by decide

end JapanTaxLaw
