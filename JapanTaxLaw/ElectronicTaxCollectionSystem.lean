/-!
# ElectronicTaxCollectionSystem — law 403M50000040054 art.1 (EXCEPTION)

Sources (pinned): law `403M50000040054`; revision and raw snapshot pinned via the
transcription pin and coordinator packet.

原文:
「国税収納命令官等（税関の国税収納命令官等を除く。以下この号において同じ。）がその所掌に属する国税等の徴収に関する事務を処理するため、財務省に設置される電子計算機と国税収納命令官等の所在する官署に設置される入出力装置とを電気通信回線で接続した電子情報処理組織」

Computation: 税関の収納命令官等は除外し、財務省の電子計算機・官署の入出力装置・
電気通信回線による接続の三要素をすべて満たすとき、定義に該当する。
Scope: 「所掌に属する事務」の範囲は NOT MODELLED（入力として受け取る）。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ElectronicTaxCollectionSystem

/-- 税関の国税収納命令官等は定義から除外（例外）。 -/
def qualifies (customsOfficer : Bool) (mofComputer : Bool)
              (officeIODevice : Bool) (telecomLink : Bool) : Bool :=
  (!customsOfficer) && mofComputer && officeIODevice && telecomLink

example : qualifies false true true true = true := by decide
example : qualifies true true true true = false := by decide
example : qualifies false false true true = false := by decide
example : qualifies false true false true = false := by decide
example : qualifies false true true false = false := by decide

end JapanTaxLaw.ElectronicTaxCollectionSystem
