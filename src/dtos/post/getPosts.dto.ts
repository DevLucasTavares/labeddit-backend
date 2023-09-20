import z from 'zod'
import { PostModel } from '../../models/Post'

export interface getPostsInputDTO {
  token: string
}

export type getPostsOutputDTO = PostModel[]

export const getPostsSchema = z.object({
  token: z.string().min(1)
})