import JapanTaxLaw.TaxFinance

/-!
# CustomsTransactionPrice — 関税定率法 art. 4（課税価格の決定の原則）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  (revision CurrentEnforced per data/INVENTORY.json)

Models the computable core of art. 4(1) — pinned bytes 逐語:

  「輸入貨物の課税標準となる価格（以下「課税価格」という。）は、…当該輸入取引に関し
    買手により売手に対し又は売手のために、当該輸入貨物につき現実に支払われた又は
    支払われるべき価格（輸出国において輸出の際に軽減又は払戻しを受けるべき関税その他の
    公課を除くものとする。）に、その含まれていない限度において次に掲げる運賃等の額を
    加えた価格（以下「取引価格」という。）とする。
    一 輸入港に到着するまでの运送に要する運賃、保険料その他当該運送に関連する費用
    二 輸入取引に関し買手により負担される手数料又は費用
       イ 仲介料その他の手数料（買付け代理者の対価を除く。）
       ロ 容器の費用  ハ 包装に要する費用
    三 生産及び輸入取引に関連して買手により無償で又は値引きをして提供された物品又は役務
       イ 材料・部分品等  ロ 工具・鋳型等  ハ 消費された物品  ニ 技術・設計等の役務
    四 特許権・意匠権・商標権等の使用に伴う対価で輸入取引をするために支払われるもの
    五 買手による処分又は使用による収益で直接又は間接に売手に帰属するもの」

Computation (Money = Nat, no coercion):

  additionsTotal a = 一 + 二イ + 二ロ + 二ハ + 三イ + 三ロ + 三ハ + 三ニ + 四 + 五
  transactionPrice paid a = paid + additionsTotal a

Scope & honest boundaries:

* `paid` (現実に支払われた価格) は caller-established Money。輸出国で軽減・払戻しを
  受けるべき関税その他の公課は「除くものとする」とあるため、caller が控除済みの額を渡す。
* 各加算項目は「その含まれていない限度において」加算される — 既に paid に含まれる
  重複分は caller が差し引いた「加算すべき正味額」を渡すものとする（Bool は式に入れない）。
* 政令で定める細目（三ニ 役務の範囲、四 権利の範囲、第2項の特殊関係・価格調整、
  第3項の委託加工）は NOT YET COVERED。art. 4の2〜4の4 の代替算定は別スライス。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 4(1) の加算項目。各フィールドは「含まれていない限度」の正味額を caller が渡す。 -/
structure CustomsAdditions where
  -- 一 輸入港までの運賃・保険料等
  freightToPort : Money
  -- 二イ 仲介料その他の手数料
  brokerage : Money
  -- 二ロ 容器の費用
  container : Money
  -- 二ハ 包装費
  packing : Money
  -- 三イ 材料・部分品等
  materials : Money
  -- 三ロ 工具・鋳型等
  tools : Money
  -- 三ハ 生産過程で消費された物品
  consumables : Money
  -- 三ニ 技術・設計等の役務
  technicalServices : Money
  -- 四 特許権等の使用対価
  ipRoyalties : Money
  -- 五 売手に帰属する処分・使用収益
  resaleProceeds : Money
  deriving DecidableEq, Repr

/-- art. 4(1) — 加算項目の合計。 -/
def additionsTotal (a : CustomsAdditions) : Money :=
  a.freightToPort + a.brokerage + a.container + a.packing + a.materials
    + a.tools + a.consumables + a.technicalServices + a.ipRoyalties + a.resaleProceeds

/-- art. 4(1) — 取引価格 = 現実支払価格 + 加算項目の合計。 -/
def transactionPrice (paid : Money) (a : CustomsAdditions) : Money :=
  paid + additionsTotal a

-- ==== verified facts ====

theorem additionsTotal_eq (a : CustomsAdditions) :
    additionsTotal a =
      a.freightToPort + a.brokerage + a.container + a.packing + a.materials
        + a.tools + a.consumables + a.technicalServices + a.ipRoyalties + a.resaleProceeds := rfl

theorem transactionPrice_eq (paid : Money) (a : CustomsAdditions) :
    transactionPrice paid a = paid + additionsTotal a := rfl

/-- 現実支払価格は取引価格以下。 -/
theorem paid_le_transactionPrice (paid : Money) (a : CustomsAdditions) :
    paid ≤ transactionPrice paid a := by
  unfold transactionPrice
  exact Nat.le_add_right paid (additionsTotal a)

/-- 各加算項目は加算合計以下（一 と 五 を例示）。 -/
theorem freight_le_additionsTotal (a : CustomsAdditions) :
    a.freightToPort ≤ additionsTotal a := by
  unfold additionsTotal
  exact Nat.le_trans (Nat.le_add_right a.freightToPort a.brokerage)
    (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage) a.container)
      (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage + a.container) a.packing)
        (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage + a.container + a.packing) a.materials)
          (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage + a.container + a.packing + a.materials) a.tools)
            (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage + a.container + a.packing + a.materials + a.tools) a.consumables)
              (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage + a.container + a.packing + a.materials + a.tools + a.consumables) a.technicalServices)
                (Nat.le_trans (Nat.le_add_right (a.freightToPort + a.brokerage + a.container + a.packing + a.materials + a.tools + a.consumables + a.technicalServices) a.ipRoyalties)
                  (Nat.le_add_right (a.freightToPort + a.brokerage + a.container + a.packing + a.materials + a.tools + a.consumables + a.technicalServices + a.ipRoyalties) a.resaleProceeds))))))))

theorem resaleProceeds_le_additionsTotal (a : CustomsAdditions) :
    a.resaleProceeds ≤ additionsTotal a := by
  unfold additionsTotal
  exact Nat.le_add_left a.resaleProceeds
    (a.freightToPort + a.brokerage + a.container + a.packing + a.materials
      + a.tools + a.consumables + a.technicalServices + a.ipRoyalties)

/-- 加算項目がすべて 0 なら取引価格 = 現実支払価格。 -/
theorem transactionPrice_zero_additions (paid : Money) :
    transactionPrice paid ⟨0, 0, 0, 0, 0, 0, 0, 0, 0, 0⟩ = paid := by
  unfold transactionPrice additionsTotal
  simp

-- ==== kernel-decided smoke checks ====

def sampleAdditions : CustomsAdditions :=
  ⟨100_000, 5_000, 2_000, 3_000, 10_000, 4_000, 1_000, 6_000, 8_000, 7_000⟩
-- 合計 = 146,000
example : additionsTotal sampleAdditions = 146_000 := by decide
-- 取引価格 = 1,000,000 + 146,000 = 1,146,000
example : transactionPrice 1_000_000 sampleAdditions = 1_146_000 := by decide
example : transactionPrice 500_000 ⟨0, 0, 0, 0, 0, 0, 0, 0, 0, 0⟩ = 500_000 := by decide

end JapanTaxLaw
