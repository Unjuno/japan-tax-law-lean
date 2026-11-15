import JapanTaxLaw.TaxFinance

/-!
# StampTable — 印紙税法 別表第一（課税物件表）第一〜三号の税率 L4 スライス

Source (pinned):
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F
  (data/raw/342AC0000000023_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

art. 2/art. 7 は課税物件と税率を別表第一に委任しているため、表自体が定義層かつ
税額計算の実体である。本モジュールは**第一号・第二号・第三号のみ**をモデル化する:

* 第一号文書（契約書: 不動産・鉱業権・無体財産権・船舶/航空機・営業譲渡・地上権又は土地の
  賃借権の設定又は譲渡・消費貸借・運送に関する契約書）— 契約金額による段階税率
* 第二号文書（請負に関する契約書）— 契約金額による段階税率
* 第三号文書（約束手形又は為替手形）— 手形金額による段階税率

非課税物件（各号の「非課税物件」欄）:

* 第一/二号: 記載金額が一万円未満の契約書 → 非課税（art. 5 により課されない）
* 第三号: 手形金額が十万円未満の手形・手形金額の記載のない手形・手形の複本又は謄本
  → 非課税。ただし**第三号２に掲げる手形**（一覧払いの手形・日本銀行/日本銀行が
  政令で定める金融機関を振出人及び受取人とする手形・外国通貨建て手形・非居住者勘定決済手形・
  輸出入に係る所定の手形）は「一通につき 二百円」— これは別区分として `isPreferredNote`
  フラグで受け取る externally established boolean である。
* 第一/二号の記載金額のない契約書 → 一通につき 二百円。

**スコープ外（明示）**:

* 別表第一の**通則**（文書の所属決定: 二以上の号の併記/混合・最少号数原則・売上代金受取書
  ルール・記載金額の計算・区分・所属号決定・政令委任）は複雑な事実認定マシンであり、
  本モジュールではモデル化しない。文書の号の特定・記載金額の確定は呼出元責任。
* 第四号以降（請負以外の建設/運送業務関連文書・金銭受取書・預金証書/預金通帳・株式/出資
  払込受領書・売上代金受取書（第十七号）・指定銀行等の預金証書等・電子記録債権の支払
  記録文書・契約証書（組合契約等）ほか）の全号は未モデル化。
* 別表第一の「記載金額」の評価（通則４・５: 二以上の記載金額の合計、区分不能分の扱い、
  第十七号受取書の売上代金按分）はモデル化しない。
* 第三号２ の各イ〜ヘの要件（一覧払いかどうか・振出人/受取人の資格・外国通貨/非居住者勘定・
  輸出入の居住者要件・政令で定める金融機関に該当するか）の認定は呼出元責任。
  なお非課税閾値（手形金額十万円未満）と第三号２の適用範囲の重なりの読み方は、
  法文の体系解釈が絡むため、本モジュールは両者を並置するだけで結論を出さない
  （`isPreferredNote = true` のとき {@stampDuty} は 200 を返すが、それが「非課税より
  優先される」との法的主張ではない）。
* 重複作成（二以上の者が共同して作成）の場合の連帯納付（art. 3(2)）はモデル化しない。
* 別表第二（非課税法人）・別表第三（非課税文書）はモデル化しない。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 別表第一の号のうち、本モジュールがモデル化するもの。 -/
inductive StampKind where
  /-- 第一号文書（契約書: 不動産・鉱業権・無体財産権・船舶/航空機・営業譲渡・地上権/土地賃借権・消費貸借・運送） -/
  | contract
  /-- 第二号文書（請負に関する契約書） -/
  | contractOfWork
  /-- 第三号文書（約束手形又は為替手形） -/
  | note
  deriving DecidableEq, Repr

/-- 課税文書の属性。各フィールドは呼出元が供給する。 -/
structure StampDocument where
  kind : StampKind
  /-- 記載金額（第一/二号: 契約金額／第三号: 手形金額）。
      `none` = 記載のない文書（第一/二号は 200円、第三号は非課税）。 -/
  statedAmount : Option Money
  /-- 第三号２ に掲げる手形（一覧払いの手形・日本銀行等を振出人及び受取人とする手形・
      外国通貨建て手形・非居住者勘定決済手形・輸出入に係る所定の手形）か。
      第一/二号では常に `false` であること（この条項は手形にのみ適用する）。 -/
  isPreferredNote : Bool
  deriving DecidableEq, Repr

/-- 第一号文書の段階税率（一通につき）。上限は「○○以下のもの」として法文で包めない。
    記載金額が一万円未満の契約書は非課税（呼出元ではなく `stampDuty` 側で処理する）。 -/
def contractStampDuty (amount : Money) : Money :=
  if amount ≤ 100_000 then 200
  else if amount ≤ 500_000 then 400
  else if amount ≤ 1_000_000 then 1_000
  else if amount ≤ 5_000_000 then 2_000
  else if amount ≤ 10_000_000 then 10_000
  else if amount ≤ 50_000_000 then 20_000
  else if amount ≤ 100_000_000 then 60_000
  else if amount ≤ 500_000_000 then 100_000
  else if amount ≤ 1_000_000_000 then 200_000
  else if amount ≤ 5_000_000_000 then 400_000
  else 600_000

/-- 第二号文書の段階税率（一通につき）。
    記載金額が一万円未満の契約書は非課税（呼出元ではなく `stampDuty` 側で処理する）。 -/
def workContractStampDuty (amount : Money) : Money :=
  if amount ≤ 1_000_000 then 200
  else if amount ≤ 2_000_000 then 400
  else if amount ≤ 3_000_000 then 1_000
  else if amount ≤ 5_000_000 then 2_000
  else if amount ≤ 10_000_000 then 10_000
  else if amount ≤ 50_000_000 then 20_000
  else if amount ≤ 100_000_000 then 60_000
  else if amount ≤ 500_000_000 then 100_000
  else if amount ≤ 1_000_000_000 then 200_000
  else if amount ≤ 5_000_000_000 then 400_000
  else 600_000

/-- 第三号文書の段階税率（一通につき）。
    手形金額十万円未満・記載のない手形は非課税、第三号２ に掲げる手形は一律200円
    （呼出元ではなく `stampDuty` 側で処理する）。 -/
def noteStampDuty (amount : Money) : Money :=
  if amount ≤ 1_000_000 then 200
  else if amount ≤ 2_000_000 then 400
  else if amount ≤ 3_000_000 then 600
  else if amount ≤ 5_000_000 then 1_000
  else if amount ≤ 10_000_000 then 2_000
  else if amount ≤ 20_000_000 then 4_000
  else if amount ≤ 30_000_000 then 6_000
  else if amount ≤ 50_000_000 then 10_000
  else if amount ≤ 100_000_000 then 20_000
  else if amount ≤ 200_000_000 then 40_000
  else if amount ≤ 300_000_000 then 60_000
  else if amount ≤ 500_000_000 then 100_000
  else if amount ≤ 1_000_000_000 then 150_000
  else 200_000

/-- 非課税物件に該当するか（art. 5 により印紙税を課さない文書）かどうか。
    第一/二号: 記載金額一万円未満。第三号: 手形金額十万円未満または記載のない手形
    （第三号２ に掲げる手形は本関数では非課税扱いのまま — 呼出元が `isPreferredNote` と
    組み合わせて判断する。`stampDuty` は両者の関係を先に `isPreferredNote` で処理する）。 -/
def isNonTaxableStampDocument (d : StampDocument) : Bool :=
  match d.kind, d.statedAmount with
  | .contract, some a => a < 10_000
  | .contractOfWork, some a => a < 10_000
  | .note, some a => a < 100_000
  | .note, none => true
  | .contract, none => false
  | .contractOfWork, none => false

/-- 印紙税の税額（一通につき）。`isPreferredNote = true` は第三号２ に該当し
    一律二百円（非課税閾値との関係は doc-comment のとおり呼出元判断）。 -/
def stampDuty (d : StampDocument) : Money :=
  match d.kind with
  | .contract =>
      match d.statedAmount with
      | none => 200
      | some a => if a < 10_000 then 0 else contractStampDuty a
  | .contractOfWork =>
      match d.statedAmount with
      | none => 200
      | some a => if a < 10_000 then 0 else workContractStampDuty a
  | .note =>
      if d.isPreferredNote then 200
      else
        match d.statedAmount with
        | none => 0
        | some a => if a < 100_000 then 0 else noteStampDuty a

/-- 課税文書に該当するか（art. 2・3 の「課税文書」）。 -/
def isTaxableDocument (d : StampDocument) : Bool :=
  match d.kind, d.statedAmount with
  | .note, _ => if d.isPreferredNote then true else !isNonTaxableStampDocument d
  | .contract, _ => !isNonTaxableStampDocument d
  | .contractOfWork, _ => !isNonTaxableStampDocument d

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 第一/二号の記載のない契約書は一通につき 200 円。 -/
theorem contract_unstated_is_200 (isPreferredNote : Bool) :
    stampDuty ⟨.contract, none, isPreferredNote⟩ = 200 := by
  cases isPreferredNote <;> decide

theorem workContract_unstated_is_200 :
    stampDuty ⟨.contractOfWork, none, false⟩ = 200 := by
  decide

/-- 第三号の記載のない手形は非課税（isPreferredNote = false のとき）。 -/
theorem note_unstated_is_0 :
    stampDuty ⟨.note, none, false⟩ = 0 := by
  decide

/-- 第三号２ に掲げる手形は一通につき 200 円。 -/
theorem note_preferred_is_200
    (statedAmount : Option Money) : stampDuty ⟨.note, statedAmount, true⟩ = 200 := by
  cases statedAmount <;> rfl

/-- 第一/二号の記載金額一万円未満は非課税。 -/
theorem contract_below_10000_is_0 (a : Money) (h : a < 10_000) :
    stampDuty ⟨.contract, some a, false⟩ = 0 := by
  unfold stampDuty
  simp [h]

theorem workContract_below_10000_is_0 (a : Money) (h : a < 10_000) :
    stampDuty ⟨.contractOfWork, some a, false⟩ = 0 := by
  unfold stampDuty
  simp [h]

/-- 第三号の手形金額十万円未満は非課税。 -/
theorem note_below_100000_is_0 (a : Money) (h : a < 100_000) :
    stampDuty ⟨.note, some a, false⟩ = 0 := by
  unfold stampDuty
  simp [h]

/-- 第一・二号の段階税率は 200 円を下回らない。 -/
theorem contractStampDuty_min_200 (a : Money) :
    200 ≤ contractStampDuty a := by
  unfold contractStampDuty
  by_cases h1 : a ≤ 100_000
  · rw [ite_eq_left h1]; decide
  · rw [ite_eq_right h1]
    by_cases h2 : a ≤ 500_000
    · rw [ite_eq_left h2]; decide
    · rw [ite_eq_right h2]
      by_cases h3 : a ≤ 1_000_000
      · rw [ite_eq_left h3]; decide
      · rw [ite_eq_right h3]
        by_cases h4 : a ≤ 5_000_000
        · rw [ite_eq_left h4]; decide
        · rw [ite_eq_right h4]
          by_cases h5 : a ≤ 10_000_000
          · rw [ite_eq_left h5]; decide
          · rw [ite_eq_right h5]
            by_cases h6 : a ≤ 50_000_000
            · rw [ite_eq_left h6]; decide
            · rw [ite_eq_right h6]
              by_cases h7 : a ≤ 100_000_000
              · rw [ite_eq_left h7]; decide
              · rw [ite_eq_right h7]
                by_cases h8 : a ≤ 500_000_000
                · rw [ite_eq_left h8]; decide
                · rw [ite_eq_right h8]
                  by_cases h9 : a ≤ 1_000_000_000
                  · rw [ite_eq_left h9]; decide
                  · rw [ite_eq_right h9]
                    by_cases h10 : a ≤ 5_000_000_000
                    · rw [ite_eq_left h10]; decide
                    · rw [ite_eq_right h10]; decide

/-- 第三号の段階税率も 200 円を下回らない。 -/
theorem noteStampDuty_min_200 (a : Money) :
    200 ≤ noteStampDuty a := by
  unfold noteStampDuty
  by_cases h1 : a ≤ 1_000_000
  · rw [ite_eq_left h1]; decide
  · rw [ite_eq_right h1]
    by_cases h2 : a ≤ 2_000_000
    · rw [ite_eq_left h2]; decide
    · rw [ite_eq_right h2]
      by_cases h3 : a ≤ 3_000_000
      · rw [ite_eq_left h3]; decide
      · rw [ite_eq_right h3]
        by_cases h4 : a ≤ 5_000_000
        · rw [ite_eq_left h4]; decide
        · rw [ite_eq_right h4]
          by_cases h5 : a ≤ 10_000_000
          · rw [ite_eq_left h5]; decide
          · rw [ite_eq_right h5]
            by_cases h6 : a ≤ 20_000_000
            · rw [ite_eq_left h6]; decide
            · rw [ite_eq_right h6]
              by_cases h7 : a ≤ 30_000_000
              · rw [ite_eq_left h7]; decide
              · rw [ite_eq_right h7]
                by_cases h8 : a ≤ 50_000_000
                · rw [ite_eq_left h8]; decide
                · rw [ite_eq_right h8]
                  by_cases h9 : a ≤ 100_000_000
                  · rw [ite_eq_left h9]; decide
                  · rw [ite_eq_right h9]
                    by_cases h10 : a ≤ 200_000_000
                    · rw [ite_eq_left h10]; decide
                    · rw [ite_eq_right h10]
                      by_cases h11 : a ≤ 300_000_000
                      · rw [ite_eq_left h11]; decide
                      · rw [ite_eq_right h11]
                        by_cases h12 : a ≤ 500_000_000
                        · rw [ite_eq_left h12]; decide
                        · rw [ite_eq_right h12]
                          by_cases h13 : a ≤ 1_000_000_000
                          · rw [ite_eq_left h13]; decide
                          · rw [ite_eq_right h13]; decide


end JapanTaxLaw
