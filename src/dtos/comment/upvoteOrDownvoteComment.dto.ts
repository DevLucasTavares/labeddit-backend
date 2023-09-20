import z from 'zod'

export interface UpvoteOrDownvoteCommentInputDTO {
  vote: boolean,
  token: string,
  commentId: string
}

export type UpvoteOrDownvoteCommentOutputDTO = undefined

export const UpvoteOrDownvoteCommentSchema = z.object({
  vote: z.boolean(),
  token: z.string().min(1),
  commentId: z.string().min(1)
})