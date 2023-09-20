import z from 'zod'

export interface DeleteCommentInputDTO {
  token: string,
  idToDelete: string
}

export type DeleteCommentOutputDTO = undefined

export const DeleteCommentSchema = z.object({
  token: z.string().min(1),
  idToDelete: z.string().min(1)
})