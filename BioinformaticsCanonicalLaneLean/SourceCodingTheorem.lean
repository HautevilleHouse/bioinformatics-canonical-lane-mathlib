import HautevilleHouse.BioinformaticsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.ShannonEntropy

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure SourceCodingPackage (S : ShannonEntropyPackage) where
  source : S.probabilityDistribution
  codeAlphabet : Type u
  codeLength : (S.probabilityDistribution → ℕ) → ℝ
  compressionTheorem : Prop
  entropyBound : Prop
  compressionTheoremProof : compressionTheorem

structure SourceCodingEvidence {S : ShannonEntropyPackage} (C : SourceCodingPackage S) where
  compressionTheoremProofClosed : C.compressionTheorem
  entropyBoundClosed : C.entropyBound

def SourceCodingClosed {S : ShannonEntropyPackage} (C : SourceCodingPackage S) : Prop :=
  C.compressionTheorem ∧ C.entropyBound

theorem source_coding_closed_from_evidence {S : ShannonEntropyPackage}
    (C : SourceCodingPackage S) (E : SourceCodingEvidence C) :
    SourceCodingClosed C := by
  exact And.intro E.compressionTheoremProofClosed E.entropyBoundClosed

end BioinformaticsCanonicalLaneLean
end HautevilleHouse