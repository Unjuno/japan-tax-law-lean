import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP6I — 登録免許税法 別表第一（二）第三十二号 百二十〜百二十四 の flat fee モデル (W-I)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_120_124.txt（百二十〜百二十四、UTF-8）

Models 別表第一（二）第三十二号 の 百二十〜百二十四 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」は 12 箇所で、
割合（千分の△）は本範囲に存在しない。全 12 件を一件につきの固定額としてモデル化する。

  百二十（一） 第一種・第二種・第三種鉄道事業の許可 ... 十五万円  → ¥150,000
  百二十（二） 索道事業の許可 ... 三万円                        → ¥30,000
  百二十（三） 軌道事業の特許 ... 十五万円                      → ¥150,000
  百二十（四） 軌道事業から鉄道事業への変更の許可 ... 十五万円    → ¥150,000
  百二十一     自動車道事業の免許 ... 十五万円                  → ¥150,000
  百二十二     高速道路の新設又は改築の許可 ... 十五万円         → ¥150,000
  百二十三     自動車ターミナル事業の許可 ... 九万円             → ¥90,000
  百二十四（一）イ 点検付随整備事業の全部の実施に係る認定 ... 九万円 → ¥90,000
  百二十四（一）ロ 点検付随整備事業の一部の実施に係る認定 ... 六万円 → ¥60,000
  百二十四（一）ハ イ及びロに掲げる認定以外の認定 ... 三万円       → ¥30,000
  百二十四（二） 登録情報処理機関の登録 ... 九万円               → ¥90,000
  百二十四（三） 登録情報提供機関の登録 ... 九万円               → ¥90,000

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・許可・免許・特許の要件・適用は
  caller-established とし、ここではモデル化しない。
* 百二十（一）（三）（四）の括弧内「無軌条の路線に係るものについては、九万円」は主額
  （十五万円）の軽減代替であり、件数一件につきの fee string ではないため別 def を作らない。
  当該該当性は caller-established とする。
* 「政令で定めるものを除く。」「一時的な需要のために期間を限定して行う許可を除く。」
  「更新の登録を除く。」「財務省令で定めるもの」等の適用判定は caller-established とし、
  金額定数には反映しない（Bool は式に入れない）。
* 百二十・百二十三の（注）に定めるみなし規定（速達性向上計画等の認定を許可／特許とみなす等）
  はデーミング規定として扱い、fee def を作らない。当該該当性も caller-established とする。
* 百十九 以前・百二十五 以降は NOT YET COVERED。
  「認定件数」「登録件数」「許可件数」「免許件数」「特許件数」の意味上の区別は非モデル化
  （一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百二十（一） 鉄道事業法第三条第一項（許可）の規定による第一種鉄道事業、第二種鉄道事業
    又は第三種鉄道事業の許可（政令で定める延長許可及び一時的な需要のための期間限定許可を除く。）の
    許可件数一件につきの額（固定 ¥150,000）。無軌条の路線に係るものについては九万円
    （caller-established、軽減代替のため別 def なし）。 -/
def railwayBusinessPermitFee : Money := 150_000

/-- 百二十（二） 鉄道事業法第三十二条（許可）の索道事業の許可の
    許可件数一件につきの額（固定 ¥30,000）。 -/
def ropewayBusinessPermitFee : Money := 30_000

/-- 百二十（三） 軌道法第三条（事業の特許）（同法第三十一条（軌道に準ずるもの）において
    準用する場合を含む。）の軌道事業の特許（政令で定める延長特許を除く。）の
    特許件数一件につきの額（固定 ¥150,000）。無軌条の路線に係るものについては九万円
    （caller-established、軽減代替のため別 def なし）。 -/
def tramwayBusinessFranchiseFee : Money := 150_000

/-- 百二十（四） 鉄道事業法第六十二条第一項（軌道からの変更）の規定による軌道事業から
    鉄道事業への変更の許可（政令で定める延長許可を除く。）の
    許可件数一件につきの額（固定 ¥150,000）。無軌条の路線に係るものについては九万円
    （caller-established、軽減代替のため別 def なし）。 -/
def tramwayToRailwayChangePermitFee : Money := 150_000

/-- 百二十一 道路運送法第四十七条第一項（免許）の自動車道事業の免許の
    免許件数一件につきの額（固定 ¥150,000）。 -/
def motorwayBusinessLicenseFee : Money := 150_000

/-- 百二十二 道路整備特別措置法（昭和三十一年法律第七号）第三条第一項
    （高速道路の新設又は改築）の規定による高速道路の新設又は改築の許可の
    許可件数一件につきの額（固定 ¥150,000）。 -/
def expresswayConstructionPermitFee : Money := 150_000

/-- 百二十三 自動車ターミナル法（昭和三十四年法律第百三十六号）第三条（事業の許可）の
    自動車ターミナル事業の許可の許可件数一件につきの額（固定 ¥90,000）。
    （注）の総合効率化計画の認定を当該許可とみなす規定はデーミング規定
    （caller-established、別 def なし）。 -/
def motorTerminalBusinessPermitFee : Money := 90_000

/-- 百二十四（一）イ 道路運送車両法第四十八条第一項（定期点検整備）の点検に付随して
    行われる自動車又はその部分の整備又は改造の事業（点検付随整備事業）の
    全部の実施に係る認定で財務省令で定めるものの認定件数一件につきの額（固定 ¥90,000）。
    「財務省令で定めるもの」の該当性は caller-established。 -/
def fullInspectionAttachedMaintenanceCertFee : Money := 90_000

/-- 百二十四（一）ロ 点検付随整備事業の一部の実施に係る認定で財務省令で定めるものの
    認定件数一件につきの額（固定 ¥60,000）。「財務省令で定めるもの」の該当性は
    caller-established。 -/
def partialInspectionAttachedMaintenanceCertFee : Money := 60_000

/-- 百二十四（一）ハ イ及びロに掲げる認定以外の認定の
    認定件数一件につきの額（固定 ¥30,000）。 -/
def otherMaintenanceCertFee : Money := 30_000

/-- 百二十四（二） 道路運送車両法第七条第四項（登録情報処理機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」の該当性は caller-established。 -/
def vehicleRegistrationInfoProcessingOrgRegFee : Money := 90_000

/-- 百二十四（三） 道路運送車両法第二十二条第三項（登録情報提供機関の登録）の登録
    （更新の登録を除く。）の登録件数一件につきの額（固定 ¥90,000）。
    「更新の登録を除く。」の該当性は caller-established。 -/
def vehicleRegistrationInfoProvidingOrgRegFee : Money := 90_000

theorem railwayBusinessPermitFee_pos : railwayBusinessPermitFee > 0 := by decide
theorem ropewayBusinessPermitFee_pos : ropewayBusinessPermitFee > 0 := by decide
theorem tramwayBusinessFranchiseFee_pos : tramwayBusinessFranchiseFee > 0 := by decide
theorem tramwayToRailwayChangePermitFee_pos : tramwayToRailwayChangePermitFee > 0 := by decide
theorem motorwayBusinessLicenseFee_pos : motorwayBusinessLicenseFee > 0 := by decide
theorem expresswayConstructionPermitFee_pos : expresswayConstructionPermitFee > 0 := by decide
theorem motorTerminalBusinessPermitFee_pos : motorTerminalBusinessPermitFee > 0 := by decide
theorem fullInspectionAttachedMaintenanceCertFee_pos :
    fullInspectionAttachedMaintenanceCertFee > 0 := by decide
theorem partialInspectionAttachedMaintenanceCertFee_pos :
    partialInspectionAttachedMaintenanceCertFee > 0 := by decide
theorem otherMaintenanceCertFee_pos : otherMaintenanceCertFee > 0 := by decide
theorem vehicleRegistrationInfoProcessingOrgRegFee_pos :
    vehicleRegistrationInfoProcessingOrgRegFee > 0 := by decide
theorem vehicleRegistrationInfoProvidingOrgRegFee_pos :
    vehicleRegistrationInfoProvidingOrgRegFee > 0 := by decide

example : railwayBusinessPermitFee = 150_000 := by decide
example : ropewayBusinessPermitFee = 30_000 := by decide
example : tramwayBusinessFranchiseFee = 150_000 := by decide
example : tramwayToRailwayChangePermitFee = 150_000 := by decide
example : motorwayBusinessLicenseFee = 150_000 := by decide
example : expresswayConstructionPermitFee = 150_000 := by decide
example : motorTerminalBusinessPermitFee = 90_000 := by decide
example : fullInspectionAttachedMaintenanceCertFee = 90_000 := by decide
example : partialInspectionAttachedMaintenanceCertFee = 60_000 := by decide
example : otherMaintenanceCertFee = 30_000 := by decide
example : vehicleRegistrationInfoProcessingOrgRegFee = 90_000 := by decide
example : vehicleRegistrationInfoProvidingOrgRegFee = 90_000 := by decide

end JapanTaxLaw
