package university;

public class Review {

   private int reviewNum;
   private int starGrade;
   private String pdname;
   private String content;
   private String id;
   
   public int getReviewNum() {
      return reviewNum;
   }
   public void setReviewNum(int reviewNum) {
      this.reviewNum = reviewNum;
   }
   public void setReviewNum(String reviewNum) {
      this.reviewNum = Integer.parseInt(reviewNum);
   }
   
   public int getStarGrade() {
      return starGrade;
   }
   public void setStarGrade(int starGrade) {
      this.starGrade = starGrade;
   }
   public void setStarGrade(String starGrade) {
      this.starGrade = Integer.parseInt(starGrade);
   }
   
   public String getPdname() {
      return pdname;
   }
   public void setPdname(String pdname) {
      this.pdname = pdname;
   }
   
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
}