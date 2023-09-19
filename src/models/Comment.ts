// backend
export interface CommentDB {
  id: string;
  user_id: string;
  post_id: string;
  content: string;
  upvotes: number;
  downvotes: number;
  created_at: string;
}

// frontend
export interface CommentModel {
  id: string;
  user: {
    id: string;
    nickname: string;
  };
  postId: string;
  content: string;
  upvotes: number;
  downvotes: number;
  createdAt: string;
}

export class Post {
  constructor(
    private id: string,
    private userId: string,
    private userNickname: string,
    private postId: string,
    private content: string,
    private upvotes: number,
    private downvotes: number,
    private createdAt: string
  ) {}

  // Getters e Setters
  public getId(): string {
    return this.id;
  }
  public setId(value: string): void {
    this.id = value;
  }

  public getUserId(): string {
    return this.userId;
  }
  public setUserId(value: string): void {
    this.userId = value;
  }

  public getUserNickname(): string {
    return this.userNickname;
  }
  public setUserNickname(value: string): void {
    this.userNickname = value;
  }

  public getPostId(): string {
    return this.postId;
  }
  public setPostId(value: string): void {
    this.postId = value;
  }

  public getContent(): string {
    return this.content;
  }
  public setContent(value: string): void {
    this.content = value;
  }

  public getUpvotes(): number {
    return this.upvotes;
  }
  public setUpvotes(value: number): void {
    this.upvotes = value;
  }

  public getDownvotes(): number {
    return this.downvotes;
  }
  public setDownvotes(value: number): void {
    this.downvotes = value;
  }

  public getCreatedAt(): string {
    return this.createdAt;
  }
  public setCreatedAt(value: string): void {
    this.createdAt = value;
  }

  // Modelos
  public toDBModel(): CommentDB {
    return {
      id: this.id,
      user_id: this.userId,
      post_id: this.postId,
      content: this.content,
      upvotes: this.upvotes,
      downvotes: this.downvotes,
      created_at: this.createdAt,
    };
  }

  public toBusinessModel(): CommentModel {
    return {
      id: this.id,
      user: {
        id: this.userId,
        nickname: this.userNickname
      },
      postId: this.postId,
      content: this.content,
      upvotes: this.upvotes,
      downvotes: this.downvotes,
      createdAt: this.createdAt,
    };
  }
}
