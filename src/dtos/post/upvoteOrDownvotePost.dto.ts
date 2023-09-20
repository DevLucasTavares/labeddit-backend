import z from 'zod'

export interface UpvoteOrDownvoteInputDTO {
  vote: boolean,
  token: string,
  postId: string
}

export type UpvoteOrDownvoteOutputDTO = undefined

export const UpvoteOrDownvoteSchema = z.object({
  vote: z.boolean(),
  token: z.string().min(1),
  postId: z.string().min(1)
})