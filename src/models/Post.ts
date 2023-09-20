// backend
export interface PostDB {
  id: string;
  creator_id: string;
  title: string;
  content: string;
  upvotes: number;
  downvotes: number;
  created_at: string;
}

// frontend
export interface PostModel {
  id: string;
  creator: {
    id: string;
    nickname: string;
  };
  title: string;
  content: string;
  upvotes: number;
  downvotes: number;
  createdAt: string;
}

export class Post {
  constructor(
    private id: string,
    private creatorId: string,
    private creatorNickname: string,
    private title: string,
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

  public getCreatorId(): string {
    return this.creatorId;
  }
  public setCreatorId(value: string): void {
    this.creatorId = value;
  }

  public getCreatorName(): string {
    return this.creatorNickname;
  }
  public setCreatorName(value: string): void {
    this.creatorNickname = value;
  }

  public getTitle(): string {
    return this.title;
  }
  public setTitle(value: string): void {
    this.title = value;
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
  public toDBModel(): PostDB {
    return {
      id: this.id,
      creator_id: this.creatorId,
      title: this.title,
      content: this.content,
      upvotes: this.upvotes,
      downvotes: this.downvotes,
      created_at: this.createdAt,
    };
  }

  public toBusinessModel(): PostModel {
    return {
      id: this.id,
      creator: {
        id: this.creatorId,
        nickname: this.creatorNickname
      },
      title: this.title,
      content: this.content,
      upvotes: this.upvotes,
      downvotes: this.downvotes,
      createdAt: this.createdAt,
    };
  }
}
